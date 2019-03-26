library(wrapr)


### Name: dot_arrow
### Title: Pipe operator ("dot arrow", "dot pipe" or "dot arrow pipe").
### Aliases: dot_arrow %.>% %>.% %.%

### ** Examples


# both should be equal:
cos(exp(sin(4)))
4 %.>% sin(.) %.>% exp(.) %.>% cos(.)




