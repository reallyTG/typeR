library(DGVM3D)


### Name: triClose
### Title: fill a polygon (number of vertices) with triangles
### Aliases: triClose

### ** Examples

par(mfrow=c(2,2))
for (m in c("plan", "fix", "center", "")) {
  faces <- sample(12:20, 1)
  vertices <- sapply(seq(0, 2*pi*(faces-1)/faces, length.out=faces),
                     function(x){c(sin(x), cos(x))})
  tri = triClose(faces, method=m)
  if (m == "center") {
    tri[is.na(tri)] = faces + 1
    vertices = cbind(vertices, c(mean(vertices[1,]), mean(vertices[2, ])))
  }
  plot(vertices[1,1:faces], vertices[2,1:faces], type="b")
  text(x=1.05*vertices[1,], y=1.05*vertices[2,], labels=1:faces, adj=0.5)
  for (i in seq(1, length(tri), 3))
    polygon(vertices[1,tri[i:(i+2)]], vertices[2,tri[i:(i+2)]],
            col=rgb(runif(1), runif(1), runif(1)))
}

par(mfrow=c(2,2))
for (faces in c(6, 12, 13, 25)) {
  vertices <- sapply(seq(0, 2*pi*(faces-1)/faces, length.out=faces),
                     function(x){c(sin(x), cos(x))})
  tri = triClose(faces, method=m)
  plot(vertices[1,], vertices[2,], type="b")
  text(x=1.05*vertices[1,], y=1.05*vertices[2,], labels=1:faces, adj=0.5)
  for (i in seq(1, length(tri), 3))
    polygon(vertices[1,tri[i:(i+2)]], vertices[2,tri[i:(i+2)]],
            col=rgb(runif(1), runif(1), runif(1)))
}



