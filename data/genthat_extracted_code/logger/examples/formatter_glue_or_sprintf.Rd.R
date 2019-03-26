library(logger)


### Name: formatter_glue_or_sprintf
### Title: Apply 'glue' and 'sprintf'
### Aliases: formatter_glue_or_sprintf

### ** Examples

## Not run: 
##D formatter_glue_or_sprintf("{a} + {b} = %s", a = 2, b = 3, 5)
##D formatter_glue_or_sprintf("{pi} * {2} = %s", pi*2)
##D formatter_glue_or_sprintf("{pi} * {2} = {pi*2}")
##D 
##D formatter_glue_or_sprintf("Hi ", "{c('foo', 'bar')}, did you know that 2*4={2*4}")
##D formatter_glue_or_sprintf("Hi {c('foo', 'bar')}, did you know that 2*4={2*4}")
##D formatter_glue_or_sprintf("Hi {c('foo', 'bar')}, did you know that 2*4=%s", 2*4)
##D formatter_glue_or_sprintf("Hi %s, did you know that 2*4={2*4}", c('foo', 'bar'))
##D formatter_glue_or_sprintf("Hi %s, did you know that 2*4=%s", c('foo', 'bar'), 2*4)
## End(Not run)



