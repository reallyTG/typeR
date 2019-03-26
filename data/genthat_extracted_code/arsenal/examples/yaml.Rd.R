library(arsenal)


### Name: yaml
### Title: Include a YAML header in 'write2'
### Aliases: yaml print.yaml c.yaml is.yaml

### ** Examples

x <- yaml(title = "My cool title", author = "Ethan P Heinzen")
x
y <- yaml("header-includes" = list("\\usepackage[labelformat=empty]{caption}"))
y
c(x, y)



