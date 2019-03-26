library(rmeta)


### Name: meta.colors
### Title: Control colours in meta-analysis plot
### Aliases: meta.colors
### Keywords: hplot

### ** Examples

data(cochrane)
steroid <- meta.MH(n.trt, n.ctrl, ev.trt, ev.ctrl,
                   names=name, data=cochrane)

## All black, for better photocopying
plot(steroid, col=meta.colors("black"))

## distinguish the summary 
plot(steroid,colors=meta.colors(summary="forestgreen"))

data(catheter)
e <- meta.DSL(n.trt, n.ctrl, inf.trt, inf.ctrl, data=catheter,
              names=Name, subset=c(13,6,3,12,4,11,1,14,8,10,2))

## Truly awful colour scheme to illustrate flexibility
plot(e, colors=meta.colors(summary="green",lines=c("purple","skyblue"),
       box="red",zero="yellow",text=palette(),background="tomato",
       axes="lightgreen"))

## Dark blue background popular for presentations.
plot(e, colors=meta.colors(summary="white",lines="#FFFFF0",
        box="#FFFF50",zero="grey90",text="white",background="darkblue",
        axes="grey90"))


