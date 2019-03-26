library(enveomics.R)


### Name: enve.barplot
### Title: enve barplot
### Aliases: enve.barplot

### ** Examples

# Load data
data("phyla.counts", package="enveomics.R", envir=environment())
# Create a barplot sorted by variance with organic trends
enve.barplot(phyla.counts, # Counts of phyla in four sites
  sizes=c(250,100,75,200), # Total sizes of the datasets of each site
  bars.width=2, # Decrease from default, so the names are fully displayed
  organic.trend=TRUE, # Nice curvy background
  sort.by=var # Sort by variance across sites
)



