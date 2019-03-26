library(wheatmap)


### Name: WHeatmap
### Title: WHeatmap object
### Aliases: WHeatmap

### ** Examples

WHeatmap(matrix(1:10, nrow=2), cmp=CMPar(brewer.name='Greens'))

WHeatmap(matrix(1:12,nrow=2), cmp=CMPar(brewer.name='Greens'), name='a') + 
    WHeatmap(matrix(1:6,nrow=1), Beneath(pad=0.05), cmp=CMPar(brewer.name='Set2'), name='b') +
    WHeatmap(matrix(c(1:30,30:1),nrow=5), Beneath(pad=0.05), 'c', cmp=CMPar(cmap='jet')) +
    WHeatmap(matrix(1:24,nrow=4), RightOf('c'), 'd', cmp=CMPar(brewer.name='Set1')) +
    WLegendV('c', LeftOf('c', pad=0.01), yticklabel.side='l') +
    WLegendV('b', RightOf('b', width=0.1)) + 
    WLegendV('a', RightOf('a')) + 
    WHeatmap(matrix(1:100, nrow=10), RightOf('d'), cmp=CMPar(brewer.name='RdYlGn')) +
    WColorBarH(matrix(5:1), TopOf(), cmp=CMPar(colorspace.name = 'diverge_hcl')) +
    WColorBarH(matrix(50:1), TopOf(), cmp=CMPar(colorspace.name = 'terrain_hcl')) +
    WColorBarH(matrix(1:8), TopOf(), cmp=CMPar(colorspace.name = 'sequential_hcl')) +
    WColorBarH(matrix(1:8), TopOf(), cmp=CMPar(brewer.name = 'YlOrRd'))

## One could use %>% too, in combination with magrittr's add function
## Not run: 
##D library(magrittr)
##D WColorBarH(1:10) %>% add(WColorBarV(rep(c('black','red','blue'),3), RightOf()))
## End(Not run)




