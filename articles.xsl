<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
    <xsl:output method="html" encoding="UTF-8" doctype-public="XHTML"/>
    <xsl:template match="/">
        
        <html>
            <head>
                <title>XSL</title>
                <!-- google : bootstrap cdn -->
                <link rel="stylesheet"
                    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></link>
            </head>
            <body>
                <table class="table table-hover table-sm">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Lang</th>
                            <th scope="col">Title</th>
                            <th scope="col">Author</th>
                            <th scope="col">Date</th>
                            <th scope="col">Excerpt</th>
                            <th scope="col">Content</th>
                            <th scope="col">Thumbnails</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/articles/article">
                           <tr>
                               <td>
                                   <xsl:value-of select="@id"/>
                               </td>
                               <td>
                                   <xsl:value-of select="@lang"/>
                               </td>
                               <td>
                                   <xsl:value-of select="title"/>
                               </td>
                               <td>
                                   <xsl:value-of select="author"/>
                               </td>
                               <td>
                                   <xsl:value-of select="date"/>
                               </td>
                               <td>
                                   <xsl:value-of select="excerpt"/>
                               </td>
                               <td>
                                   <xsl:value-of select="content"/>
                               </td>
                               <xsl:for-each select="thumbnails/image">
                                    <td>
                                        <xsl:element name="img">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                            <xsl:attribute name="width">
                                                40px
                                            </xsl:attribute>
                                        </xsl:element>
                                    </td>
                               </xsl:for-each>
      
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
        
    </xsl:template>
    <xsl:template match="articles/article">
        <tr>
            <xsl:choose>
                <xsl:when test="position() mod 2 = 0">
                    <xsl:attribute name="bgcolor">#999999</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="bgcolor">#EEEEEE</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <td>
                <xsl:value-of select="@id"/>   
            </td>
            <td>
                <xsl:value-of select="@lang"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>