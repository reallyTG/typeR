library(validate)


### Name: export_yaml
### Title: Export to yaml file
### Aliases: export_yaml as_yaml export_yaml,expressionset-method
###   as_yaml,expressionset-method

### ** Examples


v <- validator(x > 0, y > 0, x + y == z)
txt <- as_yaml(v)
cat(txt)


# NOTE: you can safely run the code below. It is enclosed in 'not run'
# statements to prevent the code from being run at test-time on CRAN
## Not run: 
##D export_yaml(v, file="my_rules.txt")
## End(Not run)




