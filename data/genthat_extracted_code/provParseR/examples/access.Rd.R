library(provParseR)


### Name: get.environment
### Title: Provenance access functions
### Aliases: get.environment get.libs get.tool.info get.scripts
###   get.saved.scripts get.proc.nodes get.data.nodes get.func.nodes
###   get.proc.proc get.data.proc get.proc.data get.func.proc get.func.lib
###   get.input.files get.output.files get.variables.set get.variables.used

### ** Examples

prov <- prov.parse(system.file ("testdata", "prov.json", package="provParseR", mustWork=TRUE))
get.proc.nodes(prov)
get.input.files(prov)
get.output.files(prov)
get.variables.set(prov)
get.variables.used(prov)
get.data.nodes(prov)
get.func.nodes(prov)
get.proc.proc(prov)
get.data.proc(prov)
get.proc.data(prov)
get.func.proc(prov)
get.func.lib(prov)
get.libs(prov)
get.scripts(prov)
get.environment(prov)




