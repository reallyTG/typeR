library(ChocoLattes)


### Name: make_productions_page
### Title: Generate HTML page with productions list and summary chart
### Aliases: make_productions_page

### ** Examples


# Load example data and convert it to a lattes list
CV.dir <- system.file("extdata", package="ChocoLattes")

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

lattes.list <- lattes_to_list(CV.dir         = CV.dir,
                              author.aliases = my.aliases)


# Build productions page:
make_productions_page(lattes.list,
                      chart.type     = "ggplot2",
                      h1.title       = "ORCS Lab",
                      h2.title       = "UFMG, Brazil",
                      language       = "EN")




