library(Nonpareil)


### Name: Nonpareil.set
### Title: Generates a collection of Nonpareil curves (a 'Nonpareil.Set'
###   object) and (optionally) plots all of them in a single canvas.
### Aliases: Nonpareil.set

### ** Examples

# Generate a Nonpareil plot with multiple curves
files <- system.file("extdata",
      c("HumanGut.npo","LakeLanier.npo","IowaSoil.npo"),
      package="Nonpareil")
col <- c("orange","darkcyan","firebrick4")
nps <- Nonpareil.set(files, col=col,
      plot.opts=list(plot.observed=FALSE, model.lwd=2))

# Show the estimated values
print(nps)

# Show current coverage (as %)
summary(nps)[,"C"]*100

# Extract Nd diversity index
summary(nps)[,"diversity"]

# Extract sequencing effort for nearly complete coverage (in Gbp)
summary(nps)[,"LRstar"]/1e9

# Predict coverage for a sequencing effort of 10Gbp
sapply(nps$np.curves, predict, 10e9)



