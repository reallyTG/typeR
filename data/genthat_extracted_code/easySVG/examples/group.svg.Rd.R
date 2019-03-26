library(easySVG)


### Name: group.svg
### Title: make svg group
### Aliases: group.svg

### ** Examples

group.svg(id = "group_1", group.content = "this is a svg element")
group.content <- list(svg1 = "this is a svg element",
                      svg2 = "this is a svg element")
group.svg(id = "group_1", group.content = group.content)
group.svg(id = "group_1", group.content = group.content,
          style.sheet = c("stroke:red", "stroke-width:1"),
          transform.sheet = c("translate(100, 100)"))




