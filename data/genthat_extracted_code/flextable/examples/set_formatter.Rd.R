library(flextable)


### Name: set_formatter
### Title: set column formatter functions
### Aliases: set_formatter set_formatter_type

### ** Examples

ft <- regulartable( head( iris ) )
ft <- set_formatter( x = ft,
        Sepal.Length = function(x) sprintf("%.02f", x),
        Sepal.Width = function(x) sprintf("%.04f", x)
      )
ft <- theme_vanilla( ft )
ft



