library(intervals)


### Name: sgd
### Title: Yeast gene model sample data
### Aliases: sgd
### Keywords: datasets

### ** Examples


# An example to compute "promoters", defined to be the 500 bases
# upstream from an ORF annotation, provided these bases don't intersect
# another orf. See documentation for the sgd data set for more details
# on the annotation set.

use_chr <- "chr01"

data( sgd )
sgd <- subset( sgd, chr == use_chr )

orf <- Intervals(
                 subset( sgd, type == "ORF", c( "start", "stop" ) ),
                 type = "Z"
                 )
rownames( orf ) <- subset( sgd, type == "ORF" )$feature_name

W <- subset( sgd, type == "ORF", "strand" ) == "W"

promoters_W <- Intervals(
                         cbind( orf[W,1] - 500, orf[W,1] - 1 ),
                         type = "Z"
                         )

promoters_W <- interval_intersection(
                                     promoters_W,
                                     interval_complement( orf )
                                     )

# Many Watson-strand genes have another ORF upstream at a distance of
# less than 500 bp

hist( size( promoters_W ) )

# All CDS entries are completely within their corresponding ORF entry.

cds_W <- Intervals(
                 subset( sgd, type == "CDS" & strand == "W", c( "start", "stop" ) ),
                 type = "Z"
                 )
rownames( cds_W ) <- NULL

interval_intersection( cds_W, interval_complement( orf[W,] ) )




