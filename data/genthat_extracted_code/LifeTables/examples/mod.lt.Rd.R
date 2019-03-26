library(LifeTables)


### Name: mod.lt
### Title: Calculate a Model Life Table
### Aliases: mod.lt
### Keywords: models misc

### ** Examples

## Example input data from USA females 1955-59 using a desired e0
mod.lt(child.value=0.02769, child.mort=4, sex="female", 
  adult.mort=0.13461, e0.target=72.5) 
  
## The user can also supply an alpha value directly
mod.lt(child.value=0.02769, child.mort=4, sex="female", 
  adult.mort=0.13461, alpha=0.233) 



