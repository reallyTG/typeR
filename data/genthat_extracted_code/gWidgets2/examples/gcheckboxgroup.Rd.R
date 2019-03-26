library(gWidgets2)


### Name: gcheckboxgroup
### Title: Constructor for checkbox group. A linked group of checkboxes,
###   but not exclusive.
### Aliases: .gcheckboxgroup addHandlerChanged.GCheckboxGroup
###   gcheckboxgroup svalue.GCheckboxGroup

### ** Examples

if(interactive()) {
  w <- gwindow("Selection widgets")
  g <- gvbox(cont=w)

  fl <- gformlayout(cont=g)
  gcheckbox("checkbox", checked=TRUE, cont=fl, label="checkbox")
  gradio(state.name[1:4], selected=2, horizontal=TRUE, cont=fl, label="gradio")
  gcheckboxgroup(state.name[1:4], horizontal=FALSE, cont=fl, label="checkbox group")

  bg <- ggroup(cont=g)
  gbutton("ok", cont=bg, handler=function(h,...) print(sapply(fl$children, svalue)))



}



