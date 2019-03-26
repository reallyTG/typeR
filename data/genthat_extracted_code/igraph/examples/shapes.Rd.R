library(igraph)


### Name: shapes
### Title: Various vertex shapes when plotting igraph graphs
### Aliases: shapes add.vertex.shape igraph.shape.noclip
###   igraph.shape.noplot vertex.shapes igraph.vertex.shapes shape_noclip
###   shape_noplot add_shape

### ** Examples

# all vertex shapes, minus "raster", that might not be available
shapes <- setdiff(shapes(), "")
g <- make_ring(length(shapes))
set.seed(42)
plot(g, vertex.shape=shapes, vertex.label=shapes, vertex.label.dist=1,
     vertex.size=15, vertex.size2=15,
     vertex.pie=lapply(shapes, function(x) if (x=="pie") 2:6 else 0),
     vertex.pie.color=list(heat.colors(5)))

# add new vertex shape, plot nothing with no clipping
add_shape("nil")
plot(g, vertex.shape="nil")

#################################################################
# triangle vertex shape
mytriangle <- function(coords, v=NULL, params) {
  vertex.color <- params("vertex", "color")
  if (length(vertex.color) != 1 && !is.null(v)) {
    vertex.color <- vertex.color[v]
  }
  vertex.size <- 1/200 * params("vertex", "size")
  if (length(vertex.size) != 1 && !is.null(v)) {
    vertex.size <- vertex.size[v]
  }

  symbols(x=coords[,1], y=coords[,2], bg=vertex.color,
          stars=cbind(vertex.size, vertex.size, vertex.size),
          add=TRUE, inches=FALSE)
}
# clips as a circle
add_shape("triangle", clip=shapes("circle")$clip,
                 plot=mytriangle)
plot(g, vertex.shape="triangle", vertex.color=rainbow(vcount(g)),
     vertex.size=seq(10,20,length=vcount(g)))

#################################################################
# generic star vertex shape, with a parameter for number of rays
mystar <- function(coords, v=NULL, params) {
  vertex.color <- params("vertex", "color")
  if (length(vertex.color) != 1 && !is.null(v)) {
    vertex.color <- vertex.color[v]
  }
  vertex.size  <- 1/200 * params("vertex", "size")
  if (length(vertex.size) != 1 && !is.null(v)) {
    vertex.size <- vertex.size[v]
  }
  norays <- params("vertex", "norays")
  if (length(norays) != 1 && !is.null(v)) {
    norays <- norays[v]
  }

  mapply(coords[,1], coords[,2], vertex.color, vertex.size, norays,
         FUN=function(x, y, bg, size, nor) {
           symbols(x=x, y=y, bg=bg,
                   stars=matrix(c(size,size/2), nrow=1, ncol=nor*2),
                   add=TRUE, inches=FALSE)
         })
}
# no clipping, edges will be below the vertices anyway
add_shape("star", clip=shape_noclip,
                 plot=mystar, parameters=list(vertex.norays=5))
plot(g, vertex.shape="star", vertex.color=rainbow(vcount(g)),
     vertex.size=seq(10,20,length=vcount(g)))
plot(g, vertex.shape="star", vertex.color=rainbow(vcount(g)),
     vertex.size=seq(10,20,length=vcount(g)),
     vertex.norays=rep(4:8, length=vcount(g)))

#################################################################
# Pictures as vertices.
# Similar musicians from last.fm, we start from an artist and
# will query two levels. We will use the XML, png and jpeg packages
# for this, so these must be available. Otherwise the example is
# skipped

loadIfYouCan <- function(pkg) suppressWarnings(do.call(require, list(pkg)))

if (loadIfYouCan("XML") && loadIfYouCan("png") &&
    loadIfYouCan("jpeg")) {
  url <- paste(sep="",
               'http://ws.audioscrobbler.com/',
               '2.0/?method=artist.getinfo&artist=%s',
               '&api_key=1784468ada3f544faf9172ee8b99fca3')
  getartist <- function(artist) {
    cat("Downloading from last.fm. ... ")
    txt <- readLines(sprintf(url, URLencode(artist)))
    xml <- xmlTreeParse(txt, useInternal=TRUE)
    img <- xpathSApply(xml, "/lfm/artist/image[@size='medium'][1]",
                       xmlValue)
    if (img != "") {
      con <- url(img, open="rb")
      bin <- readBin(con, what="raw", n=10^6)
      close(con)
      if (grepl("\\\\.png$", img)) {
        rast <- readPNG(bin, native=TRUE)
      } else if (grepl("\\\\.jpe?g$", img)) {
        rast <- readJPEG(bin, native=TRUE)
      } else {
        rast <- as.raster(matrix())
      }
    } else {
      rast <- as.raster(numeric())
    }
    sim <- xpathSApply(xml, "/lfm/artist/similar/artist/name", xmlValue)
    cat("done.\\n")
    list(name=artist, image=rast, similar=sim)
  }

  ego <- getartist("Placebo")
  similar <- lapply(ego$similar, getartist)

  edges1 <- cbind(ego$name, ego$similar)
  edges2 <- lapply(similar, function(x) cbind(x$name, x$similar))
  edges3 <- rbind(edges1, do.call(rbind, edges2))
  edges <- edges3[ edges3[,1] %in% c(ego$name, ego$similar) &
                   edges3[,2] %in% c(ego$name, ego$similar), ]

  musnet <- simplify(graph_from_data_frame(edges, dir=FALSE,
                     vertices=data.frame(name=c(ego$name, ego$similar))))
  print_all(musnet)

  V(musnet)$raster <- c(list(ego$image), lapply(similar, "[[", "image"))
  plot(musnet, layout=layout_as_star, vertex.shape="raster",
       vertex.label=V(musnet)$name, margin=.2,
       vertex.size=50, vertex.size2=50,
       vertex.label.dist=2, vertex.label.degree=0)
} else {
  message("You need the `XML', `png' and `jpeg' packages to run this")
}



