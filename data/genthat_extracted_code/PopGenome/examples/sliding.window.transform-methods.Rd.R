library(PopGenome)


### Name: sliding.window.transform-methods
### Title: Sliding Window Transformation
### Aliases: sliding.window.transform,GENOME-method
###   sliding.window.transform-methods
### Keywords: methods

### ** Examples

# GENOME.class       <- readData("...\Alignments")
# slide.GENOME.class <- sliding.window.transform(GENOME.class)
# slide.GENOME.class <- sliding.window.transform(GENOME.class,100,100)
# slide.GENOME.class <- neutrality.stats(slide.GENOME.class)
# slide.GENOME.class@region.names
# values             <- get.neutrality(slide.GENOME.class)
# GENOME.class       <- readSNP("Arabidopsis", CHR=1)
# GENOME.slide       <- sliding.window.transform(GENOME.split, 10000, 10000, type=2,
# start.pos=10000000, end.pos=12000000)
# GENOME.slide@region.names



