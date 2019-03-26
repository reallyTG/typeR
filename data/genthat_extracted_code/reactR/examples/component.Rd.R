library(reactR)


### Name: component
### Title: Create a React component
### Aliases: component

### ** Examples

component("ParentComponent",
  list(
    x = 1,
    y = 2,
    component("ChildComponent"),
    component("OtherChildComponent")
  )
)



