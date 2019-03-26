library(XML)


### Name: makeClassTemplate
### Title: Create S4 class definition based on XML node(s)
### Aliases: makeClassTemplate
### Keywords: programming

### ** Examples

txt =
"<doc><part><name>ABC</name><type>XYZ</type><cost>3.54</cost><status>available</status></part></doc>"
 doc = xmlParse(txt)

 code = makeClassTemplate(xmlRoot(doc)[[1]], types = c(cost = "numeric"))

 as(xmlRoot(doc)[["part"]], "part")



