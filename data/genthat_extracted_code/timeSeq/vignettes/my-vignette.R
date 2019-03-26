## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  rowSums(cpm(data)>100) >= 2

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  data(pAbp)
#  attach(pAbp)
#  model.fit <- timeSeq(data.count, group.label, gene.names, exon.length)
#  detach(pAbp)
#

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  model.fit$NPDE.ratio
#  model.fit$PDE.ratio
#

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  data(simulate.dt)
#  attach(simulate.dt)
#  model.fit <- timeSeq(data.count, group.label, gene.names, exon.level=FALSE)
#  timeSeq.screeplot(model.fit, "lines")

## ----  eval=FALSE, tidy=TRUE---------------------------------------------
#  data(simulate.dt)
#  attach(simulate.dt)
#  model.fit <- timeSeq(data.count, group.label, gene.names,exon.level=FALSE)
#  timeSeq.heatmap(model.fit, n=10)
