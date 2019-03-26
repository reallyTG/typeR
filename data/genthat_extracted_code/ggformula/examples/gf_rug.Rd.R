library(ggformula)


### Name: gf_rug
### Title: Formula interface to geom_rug()
### Aliases: gf_rug gf_rugx gf_rugy

### ** Examples

gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
gf_rug(Sepal.Length ~ Sepal.Width)

# There are several ways to control x- and y-rugs separately
gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
gf_rugx( ~ Sepal.Width,  data = iris, color = "red") %>%
gf_rugy(Sepal.Length ~ ., data = iris, color = "green")

gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
gf_rug(. ~ Sepal.Width,  data = iris, color = "red", inherit = FALSE) %>%
gf_rug(Sepal.Length ~ ., data = iris, color = "green", inherit = FALSE)

gf_point(Sepal.Length ~ Sepal.Width, data = iris) %>%
gf_rug(. ~ Sepal.Width,  data = iris, color = "red", sides = "b") %>%
gf_rug(Sepal.Length ~ ., data = iris, color = "green", sides = "l")

# jitter requires both an x and a y, but we can turn off one or the other with sides
gf_jitter(Sepal.Length ~ Sepal.Width, data = iris) %>%
gf_rug(color = "green", sides = "b", position = "jitter")

# rugs work with some 1-varialbe plots as well.
gf_histogram( ~ eruptions, data = faithful) %>%
gf_rug( ~ eruptions, data = faithful, color = "red")%>%
gf_rug( ~ eruptions, data = faithful, color = "navy", sides = "t")

# we can take advantage of inheritance to shorten the code
gf_histogram( ~ eruptions, data = faithful) %>%
gf_rug(color = "red") %>%
gf_rug(color = "navy", sides = "t")

# Need to turn off inheritance when using gf_dhistogram:
gf_dhistogram( ~ eruptions, data = faithful) %>%
gf_rug( ~ eruptions, data = faithful, color = "red", inherit = FALSE)

# using jitter with gf_histogram() requires manually setting the y value.
gf_dhistogram( ~ Sepal.Width, data = iris) %>%
gf_rug(0 ~ Sepal.Width, data = iris, color = "green", sides = "b", position = "jitter")

# the choice of y value can affect how the plot looks.
gf_dhistogram( ~ Sepal.Width, data = iris) %>%
gf_rug(0.5 ~ Sepal.Width, data = iris, color = "green", sides = "b", position = "jitter")



