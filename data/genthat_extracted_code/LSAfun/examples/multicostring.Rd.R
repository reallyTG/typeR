library(LSAfun)


### Name: multicostring
### Title: Sentence x Vector Comparison
### Aliases: multicostring

### ** Examples
data(wonderland)

multicostring("Alice was beginning to get very tired.",
        "A white rabbit with a clock ran close to her.",
        tvectors=wonderland)

multicostring("Suddenly, a cat appeared in the woods",
names(neighbors("cheshire",n=20,tvectors=wonderland)), 
tvectors=wonderland)


