library(ChocoLattes)


### Name: lattes_to_list
### Title: Convert a set of Lattes CV XML files to a list object
### Aliases: lattes_to_list

### ** Examples

my.dir <- system.file("extdata", package="ChocoLattes")

# Define the aliases of authors "Felipe Campelo" and "Lucas S. Batista":
# (all aliases will be converted to the first name provided for each author)
my.aliases <- list(c("Felipe Campelo",
                     "Felipe Campelo Franca Pinto",
                     "Felipe Campelo F. Pinto",
                     "F.C.F. Pinto"),
                   c("Lucas S. Batista",
                     "Lucas Batista",
                     "Lucas de Souza Batista",
                     "Lucas Souza Batista"))

lattes.list <- lattes_to_list(CV.dir         = my.dir,
                              author.aliases = my.aliases)



