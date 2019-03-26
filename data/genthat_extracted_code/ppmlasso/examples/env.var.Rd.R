library(ppmlasso)


### Name: env.var
### Title: Extract environmental data to presence locations
### Aliases: env.var
### Keywords: Interpolation

### ** Examples

data(BlueMountains)
species.env = env.var(BlueMountains$eucalypt, env.grid = BlueMountains$env, env.scale = 0.5,
file.name = "Sp Env Data")



