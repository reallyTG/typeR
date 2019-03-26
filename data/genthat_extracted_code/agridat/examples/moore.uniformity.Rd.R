library(agridat)


### Name: moore.uniformity
### Title: Uniformity trials of pole beans, bush beans, sweet corn,
###   carrots, spring and fall cauliflower
### Aliases: moore.polebean.uniformity moore.bushbean.uniformity
###   moore.sweetcorn.uniformity moore.carrot.uniformity
###   moore.springcauliflower.uniformity moore.fallcauliflower.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   cv <- function(x) sd(x)/mean(x)
##D 
##D   require(desplot)
##D   
##D   # Pole Bean
##D   data(moore.polebean.uniformity)
##D   cv(moore.polebean.uniformity$yield) # 8.00. Moore says 6.73.
##D   desplot(yield~col*row, moore.polebean.uniformity,
##D           flip=TRUE, tick=TRUE, aspect=120/60, # true aspect
##D           main="moore.polebean.uniformity - yield")
##D 
##D   # Bush bean
##D   data(moore.bushbean.uniformity)
##D   cv(moore.bushbean.uniformity$yield) # 12.1. Moore says 10.8
##D   desplot(yield~col*row, moore.bushbean.uniformity,
##D           flip=TRUE, tick=TRUE, aspect=120/72, # true aspect
##D           main="moore.bushbean.uniformity - yield")
##D 
##D   # Sweet corn
##D   data(moore.sweetcorn.uniformity)
##D   cv(moore.sweetcorn.uniformity$yield) # 17.5. Moore says 13.6
##D   desplot(yield~col*row, moore.sweetcorn.uniformity,
##D           flip=TRUE, tick=TRUE, aspect=120/72, # true aspect
##D           main="moore.sweetcorn.uniformity - yield")
##D   ## desplot(ears~col*row, moore.sweetcorn.uniformity,
##D   ##         flip=TRUE, tick=TRUE, aspect=120/72, # true aspect
##D   ##         main="moore.sweetcorn.uniformity - ears")
##D   ## library(lattice)
##D   ## xyplot(yield ~ ears, moore.sweetcorn.uniformity)
##D   
##D   require(desplot)
##D   # Carrot
##D   data(moore.carrot.uniformity)
##D   cv(moore.carrot.uniformity$yield) # 33.4. Moore says 27.6
##D   desplot(yield~col*row, moore.carrot.uniformity,
##D           flip=TRUE, tick=TRUE, aspect=60/36, # true aspect
##D           main="moore.carrot.uniformity - yield")
##D 
##D   require(desplot)
##D   # Spring cauliflower
##D   data(moore.springcauliflower.uniformity)
##D   cv(moore.springcauliflower.uniformity$yield) # 21. Moore says 19.5
##D   desplot(yield~col*row, moore.springcauliflower.uniformity,
##D           flip=TRUE, tick=TRUE, aspect=300/36, # true aspect
##D           main="moore.springcauliflower.uniformity - yield")
##D   ## desplot(heads~col*row, moore.springcauliflower.uniformity,
##D   ##         flip=TRUE, tick=TRUE, aspect=300/36, # true aspect
##D   ##         main="moore.springcauliflower.uniformity - heads")
##D   ## library(lattice)
##D   ## xyplot(yield ~ heads, moore.springcauliflower.uniformity)
##D 
##D   require(desplot)
##D   # Fall cauliflower
##D   data(moore.fallcauliflower.uniformity)
##D   cv(moore.fallcauliflower.uniformity$yield) # 17.7. Moore says 17.0
##D   desplot(yield~col*row, moore.fallcauliflower.uniformity,
##D           flip=TRUE, tick=TRUE, aspect=300/36, # true aspect
##D           main="moore.fallcauliflower.uniformity - yield")
##D   ## desplot(heads~col*row, moore.fallcauliflower.uniformity,
##D   ##         flip=TRUE, tick=TRUE, aspect=300/36, # true aspect
##D   ##         main="moore.fallcauliflower.uniformity - heads")
##D   ## library(lattice)
##D   ## xyplot(yield ~ heads, moore.fallcauliflower.uniformity)
##D   
## End(Not run)



