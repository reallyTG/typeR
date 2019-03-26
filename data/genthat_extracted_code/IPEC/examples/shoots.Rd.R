library(IPEC)


### Name: shoots
### Title: Height Growth Data of Bamboo Shoots
### Aliases: shoots

### ** Examples

data(shoots)
attach(shoots)
# Choose a species
# 1: Phyllostachys iridescens; 2: Phyllostachys mannii; 
# 3: Sinobambusa tootsik; 4: Pleioblastus maculatus
ind <- 1
x3  <- time[code == ind]
y3  <- height[code == ind] 
dev.new()
par(mar=c(5,5,2,2))
plot(x3, y3, cex=1.5, cex.lab=1.5, cex.axis=1.5, xlab="Time (d)", ylab="Height (cm)")



