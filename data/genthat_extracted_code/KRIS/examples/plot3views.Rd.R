library(KRIS)


### Name: plot3views
### Title: Create scatter plots in three views.
### Aliases: plot3views

### ** Examples


#Load simulated dataset
data(example_SNP)

PCs <- cal.pc.linear(simsnp$snp, no.pc = 3)
plot3views( PCs$PC, sample_labels)

#To change colors and patterns using symbols
all.labels <- unique(sample_labels)
my.colors <- c('pink', 'yellow', 'cyan', 'green')
my.patterns<- c(0,1,2,3)
my.table <- data.frame(all.labels, my.patterns, my.colors)
plot3views(PCs$PC, labels = sample_labels, col.pat.table = my.table)

#To change colors and patterns using characters
my.patterns<- c('o', 'x', '&', '#')
#Use cbind to keep my.patterns as 'character'
my.table <- cbind(all.labels, my.patterns, my.colors)
plot3views(PCs$PC, labels = sample_labels, col.pat.table = my.table)



