library(RIdeogram)


### Name: ideogram
### Title: ideogram
### Aliases: ideogram

### ** Examples

# Loading the package
require(RIdeogram)

# Loading the testing data
data(human_karyotype, package="RIdeogram")
data(gene_density, package="RIdeogram")
data(Random_RNAs_500, package="RIdeogram")

# Checking the data format
head(human_karyotype)
head(gene_density)
head(Random_RNAs_500)

# Running the function
ideogram(karyotype = human_karyotype)
convertSVG("chromosome.svg", device = "png")

# Then, you will find a SVG file and a PNG file in your Working Directory.




