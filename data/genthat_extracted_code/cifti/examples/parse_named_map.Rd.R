library(cifti)


### Name: parse_named_map
### Title: Parse Named Map from CIFTI
### Aliases: parse_named_map get_named_map

### ** Examples

## Not run: 
##D doc = cifti_xml(fname)
##D nodes = xml_find_all(doc, "/CIFTI/Matrix/MatrixIndicesMap")
##D nodeset = xml_find_all(nodes, "./NamedMap")
##D parse_named_map(nodeset)
## End(Not run)



