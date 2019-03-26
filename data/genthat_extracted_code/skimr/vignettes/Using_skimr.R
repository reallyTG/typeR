## ------------------------------------------------------------------------
summary(iris)

## ------------------------------------------------------------------------
summary(iris$Sepal.Length)

## ------------------------------------------------------------------------
fivenum(iris$Sepal.Length)

## ------------------------------------------------------------------------
summary(iris$Species)

## ------------------------------------------------------------------------
library(skimr)
skim(iris)

## ------------------------------------------------------------------------
skim(iris) %>%
  dplyr::filter(stat == "mean")


## ------------------------------------------------------------------------
s <- skim(iris)
head(s, 15)

## ------------------------------------------------------------------------
mtcars %>%
  dplyr::group_by(gear) %>%
  skim()

## ------------------------------------------------------------------------
skim(iris, Sepal.Length, Species)
skim(iris, starts_with("Sepal"))


## ------------------------------------------------------------------------
skim(datasets::lynx)

## ------------------------------------------------------------------------
lynx <- datasets::lynx
class(lynx) <- "unknown_class"
skim(lynx)


## ------------------------------------------------------------------------
m <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), nrow = 4, ncol = 3)
m
colMeans(m)
rowMeans(m)
mean(m)

skim(as.data.frame(m))    # Similar to summary.matrix and colMeans()
skim(as.data.frame(t(m))) # Similar to rowMeans()
skim(c(m))                # Similar to mean()


## ------------------------------------------------------------------------
skim(m[,1])
skim(m[1,])


## ------------------------------------------------------------------------
iris_setosa <- iris %>%
  skim_tee(iris) %>%
  dplyr::filter(Species == "setosa")


## ------------------------------------------------------------------------
iris %>% skim_to_list()
iris_skimmed <- iris %>% skim_to_list()
iris_skimmed[["numeric"]] %>% dplyr::select(mean, sd)

## ------------------------------------------------------------------------
iris %>% skim_to_wide(iris)

## ------------------------------------------------------------------------
skim_with(numeric = list(mad_name = mad))
skim(datasets::chickwts)


## ------------------------------------------------------------------------
skim_with_defaults()
skim_with(numeric = list(mad_name = mad), append = FALSE)
skim(datasets::chickwts)
skim_with_defaults() # Reset to defaults


## ------------------------------------------------------------------------
skim_with(numeric = list(hist = NULL))
skim(datasets::chickwts)
skim_with_defaults()


## ------------------------------------------------------------------------
skim(iris) %>% skimr::kable()

## ------------------------------------------------------------------------
library(pander)
panderOptions('knitr.auto.asis', FALSE)
skim(iris) %>% pander() 


