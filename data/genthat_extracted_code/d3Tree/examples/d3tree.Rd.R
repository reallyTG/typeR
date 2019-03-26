library(d3Tree)


### Name: d3tree
### Title: d3tree
### Aliases: d3tree

### ** Examples

 

## No test: 
if(interactive()){

d3tree(list(root = df2tree(rootname='Titanic',
                           struct=as.data.frame(Titanic)
                           ),
            layout = 'collapse')
      )

d3tree(list(root = df2tree(rootname='Titanic',
                           struct=as.data.frame(Titanic),
                           toolTip=letters[1:(ncol(as.data.frame(Titanic))+1)]),
            layout = 'collapse')
      )

d3tree(list(root = df2tree(rootname = 'book',
                           struct = stan.models),
            layout = 'collapse')
      )
}
## End(No test)




