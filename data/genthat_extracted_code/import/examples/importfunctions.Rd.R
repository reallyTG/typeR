library(import)


### Name: from
### Title: Import objects from a package.
### Aliases: from here into

### ** Examples

import::from(parallel, makeCluster, parLapply)
import::into("imports:parallel", makeCluster, parLapply, .from = parallel)



