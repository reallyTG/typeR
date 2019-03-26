library(switchr)


### Name: BiocSVNManifest
### Title: Create a manifest of Bioc SVN locations
### Aliases: BiocSVNManifest

### ** Examples

## wrapped in try because it fails on some finnicky build systems
bman = try(BiocSVNManifest())
bman
## Not run: 
##D repo = lazyRepo("rtracklayer", bman)
## End(Not run)



