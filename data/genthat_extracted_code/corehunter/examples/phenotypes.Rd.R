library(corehunter)


### Name: phenotypes
### Title: Create Core Hunter phenotype data from data frame or file.
### Aliases: phenotypes

### ** Examples

# create from data frame
pheno.data <- data.frame(
 season = c("winter", "summer", "summer", "winter", "summer"),
 yield = c(34.5, 32.6, 22.1, 54.12, 43.33),
 size = ordered(c("l", "s", "s", "m", "l"), levels = c("s", "m", "l")),
 resistant = c(FALSE, TRUE, TRUE, FALSE, TRUE)
)
pheno <- phenotypes(pheno.data)

# explicit types
pheno <- phenotypes(pheno.data, types = c("N", "R", "O", "NB"))
# treat last column as symmetric binary, auto infer others
pheno <- phenotypes(pheno.data, types = c(NA, NA, NA, "NS"))

# explicit ranges
pheno <- phenotypes(pheno.data, min = c(NA, 20.0, NA, NA), max = c(NA, 60.0, NA, NA))

# read from file
pheno.file <- system.file("extdata", "phenotypes.csv", package = "corehunter")
pheno <- phenotypes(file = pheno.file)




