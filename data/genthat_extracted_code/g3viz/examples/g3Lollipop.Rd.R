library(g3viz)


### Name: g3Lollipop
### Title: G3Lollipop diagram for mutation data
### Aliases: g3Lollipop

### ** Examples

## Not run: 
##D # Example 1: visualize mutation data from cBioPortal
##D #   note: internet access required, may use more than 10 seconds
##D mutation.dat <- getMutationsFromCbioportal("msk_impact_2017", "TP53")
##D # lollipop diagram with default options
##D g3Lollipop(mutation.dat, gene.symbol = "TP53")
## End(Not run)
# Example 2: visualize mutation data from MAF file
# load MAF file
maf.file <- system.file("extdata", "TCGA.BRCA.varscan.somatic.maf.gz", package = "g3viz")
mutation.dat <- readMAF(maf.file)

# lollipop diagram, classified by "Variant_Classification"
# plot options: add chart title
plot.options <- g3Lollipop.options(
                     chart.margin = list(left = 40, right = 40, top = 30, bottom = 25),
                     title.text = "PIK3CA (TCGA-BRCA)",
                     title.font = "normal 20px Sans",
                     title.color = "steelblue",
                     title.alignment = "middle",
                     title.dy = "0.3em")
g3Lollipop(mutation.dat,
           gene.symbol = "PIK3CA",
           factor.col = "Variant_Classification",
           plot.options = plot.options)

# Example 3: visualize mutation data in CSV or TSV formatted file
# load data
mutation.csv <- system.file("extdata", "ccle.csv", package = "g3viz")

# customized column names
mutation.dat <- readMAF(mutation.csv,
                        gene.symbol.col = "Hugo_Symbol",
                        variant.class.col = "Variant_Classification",
                        protein.change.col = "amino_acid_change",
                        sep = ",")  # separator of csv file

# plot options: try to mimic MutationMapper (http://www.cbioportal.org/mutation_mapper.jsp)
#               change color scheme of mutation track and domain annotation track
plot.options <- g3Lollipop.options(chart.width = 1600,
                                   chart.type = "circle",
                                   lollipop.track.background = "transparent",
                                   lollipop.pop.max.size = 4,
                                   lollipop.pop.min.size = 4,
                                   lollipop.pop.info.limit = 4.1, # same pop size
                                   y.axis.label = "# Mutations",
                                   lollipop.line.color = "grey",
                                   lollipop.line.width = 0.5,
                                   lollipop.circle.color = "black",
                                   lollipop.circle.width = 0.5,
                                   lollipop.color.scheme = "bottlerocket2",
                                   anno.bar.margin = list(top = 5, bottom = 5),
                                   domain.color.scheme = "darjeeling2",
                                   domain.text.font = "normal 8px Arial",
                                   domain.text.color = "white")

g3Lollipop(mutation.dat,
           gene.symbol = "APC",
           protein.change.col = "amino_acid_change",
           plot.options = plot.options)




