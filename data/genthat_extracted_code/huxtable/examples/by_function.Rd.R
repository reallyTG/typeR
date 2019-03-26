library(huxtable)


### Name: by_function
### Title: Map cell contents to cell properties using a function or scale
### Aliases: by_function

### ** Examples

ht <- as_hux(matrix(runif(20), 5, 4))

map_background_color(ht,
      by_function(grey))

if (requireNamespace("scales")) {
  map_text_color(ht, by_function(
          scales::seq_gradient_pal()
        ))
}



