library(texPreview)


### Name: build_usepackage
### Title: Build usepackage command for TeX document
### Aliases: build_usepackage

### ** Examples

build_usepackage(pkg = 'xcolor')
build_usepackage(pkg = 'xcolor',options = 'usenames')

#build many at once using mapply

geom.opts=c('paperwidth=35cm','paperheight=35cm','left=2.5cm','top=2.5cm')
use.opts="\\usetikzlibrary{mindmap,backgrounds}"

unlist(mapply(build_usepackage,
pkg =        list('times','geometry','tikz'),
options=     list(NULL   ,geom.opts ,NULL),
uselibrary = list(NULL   ,NULL      ,use.opts)
))



