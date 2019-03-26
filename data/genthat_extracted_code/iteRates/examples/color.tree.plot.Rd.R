library(iteRates)


### Name: color.tree.plot
### Title: color.tree.plot
### Aliases: color.tree.plot

### ** Examples

data(geospiza)
attach(geospiza)

output.geospiza <- comp.subs(geospiza.tree)

color.tree.plot(out=output.geospiza, tree= geospiza.tree)	
color.tree.plot(out=output.geospiza, tree= geospiza.tree, NODE=FALSE)	
color.tree.plot(out=output.geospiza, tree= geospiza.tree, p.thres=1)	
color.tree.plot(out=output.geospiza, tree= geospiza.tree, scale=2)	



