library(polmineR)


### Name: as.VCorpus
### Title: Coerce partition_bundle to VCorpus.
### Aliases: as.VCorpus as.VCorpus,partition_bundle-method as

### ** Examples

use("polmineR")
p <- partition("GERMAPARLMINI", date = "2009-11-10")
pb <- partition_bundle(p, s_attribute = "speaker")
vc <- as.VCorpus(pb) # works only, if tm-package has not yet been loaded
vc <- as(pb, "VCorpus") # will work if tm-package has been loaded, too



