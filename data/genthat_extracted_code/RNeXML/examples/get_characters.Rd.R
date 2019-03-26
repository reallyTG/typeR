library(RNeXML)


### Name: get_characters
### Title: Get character data.frame from nexml
### Aliases: get_characters

### ** Examples

## Not run: 
##D # A simple example with a discrete and a continous trait
##D f <- system.file("examples", "comp_analysis.xml", package="RNeXML")
##D nex <- read.nexml(f)
##D get_characters(nex)
##D 
##D # A more complex example -- currently ignores sequence-type characters
##D f <- system.file("examples", "characters.xml", package="RNeXML")
##D nex <- read.nexml(f)
##D get_characters(nex)
##D 
##D # if polymorphic or uncertain states need special treatment, request state
##D # types to be returned as well:
##D f <- system.file("examples", "ontotrace-result.xml", package="RNeXML")
##D nex <- read.nexml(f)
##D res <- get_characters(nex, include_state_types = TRUE)
##D row.has.p <- apply(res$state_types, 1, 
##D                    function(x) any(x == "polymorphic", na.rm = TRUE))
##D col.has.p <- apply(res$state_types, 2, 
##D                    function(x) any(x == "polymorphic", na.rm = TRUE))
##D res$characters[row.has.p, col.has.p, drop=FALSE] # polymorphic rows and cols
##D res$characters[!row.has.p, drop=FALSE] # drop taxa with polymorphic states
##D # replace polymorphic state symbols in matrix with '?'
##D m1 <- mapply(function(s, s.t) ifelse(s.t == "standard", s, "?"), 
##D              res$characters, res$state_types)
##D row.names(m1) <- row.names(res$characters)
##D m1
## End(Not run)



