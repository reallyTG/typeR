library(xml2)


### Name: as_list
### Title: Coerce xml nodes to a list.
### Aliases: as_list

### ** Examples

as_list(read_xml("<foo> a <b /><c><![CDATA[<d></d>]]></c></foo>"))
as_list(read_xml("<foo> <bar><baz /></bar> </foo>"))
as_list(read_xml("<foo id = 'a'></foo>"))
as_list(read_xml("<foo><bar id='a'/><bar id='b'/></foo>"))



