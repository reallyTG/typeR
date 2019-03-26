library(pez)


### Name: eco.scape
### Title: eco.space scape simulation with a macro-ecological focus
### Aliases: eco.scape

### ** Examples

# Simulations
tree <- rcoal(64)

scape1 <- eco.scape(tree, scape.size=25, g.center=1,
    signal.center=FALSE, K=100, extinction=TRUE)
scape2 <- eco.scape(tree, scape.size=16, g.center=0.2,
    signal.center=TRUE, K=100, extinction=FALSE)
scape3 <- eco.scape(tree, scape.size=16, g.center=20,
    signal.center=TRUE, K=100, extinction=TRUE)

# Plotting distributions and landscape patterns
original_landscape <- scape1
abundmax <- original_landscape$K
PA_mat <- as.matrix(original_landscape$Y)
abund_mat <- original_landscape$Yab
site.size <- nrow(PA_mat)
species <- ncol(PA_mat)
mx <- original_landscape$gradient
env <- original_landscape$environ$env.gradient
par(mfrow=c(2,2), oma=c(0,0,2,0))
heatcol <- (colorRampPalette(c("yellow","red")))

image(matrix(env,sqrt(site.size),sqrt(site.size),byrow=TRUE),
    col=heatcol(max(env)),xaxt="n",yaxt="n",main="Env gradient")

image(matrix(rowSums(PA_mat),sqrt(site.size),sqrt(site.size),byrow=TRUE),
    col=heatcol(16),xaxt="n",yaxt="n",main="Species Richness")

hist(colSums(PA_mat),ylab="Number of species",xlab="Number of sites",
    main="Species Area Relationship",col="lightgrey")

hist(colSums(abund_mat),ylab="Number of species",xlab="Number of individuals",
    main="Species Abundance Relationship",col="lightgrey")
mtext("Env random, phy.signal=0.2, 32 species", outer=TRUE, side=3, cex=1.25)



