## ---- fig.height=8, fig.width=7, fig.align='center'----------------------
library(ggsom)
suppressMessages(library(tidyverse))
suppressMessages(library(kohonen))
library(ggthemes)

iris_som <-
kohonen::som(scale(iris[1:4]), grid = somgrid(6, 4, "rectangular"))
ggsom::ggsom_line(aes_som(iris_som), TRUE)

## ---- fig.height=8, fig.width=7, fig.align='center'----------------------
library(ggsom)
suppressMessages(library(tidyverse))
suppressMessages(library(kohonen))
library(ggthemes)

iris_som <-
kohonen::som(scale(iris[1:4]), grid = somgrid(6, 4, "rectangular"))
ggsom::ggsom_line(aes_som(iris_som), FALSE)

## ---- fig.height=8, fig.width=7, fig.align='center'----------------------
library(ggsom)
suppressMessages(library(tidyverse))
suppressMessages(library(kohonen))
library(ggthemes)

iris_som <-
kohonen::som(scale(iris[1:4]), grid = somgrid(6, 4, "rectangular"))
ggsom_ribbon(aes_som(iris_som, cutree_value = 2) , TRUE)

## ---- fig.height=8, fig.width=7, fig.align='center'----------------------
library(ggsom)
suppressMessages(library(tidyverse))
suppressMessages(library(kohonen))
library(ggthemes)

iris_som <-
kohonen::som(scale(iris[1:4]), grid = somgrid(6, 4, "rectangular"))
ggsom_rect(aes_som(iris_som, cutree_value = 4), TRUE)

