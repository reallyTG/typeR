## ----message=FALSE-------------------------------------------------------
library(wordspace)

## ----echo=FALSE----------------------------------------------------------
set.seed(42)
idx <- sort(sample.int(nrow(DSM_VerbNounTriples_BNC), 10))
knitr::kable(DSM_VerbNounTriples_BNC[idx, ])

## ------------------------------------------------------------------------
Triples <- subset(DSM_VerbNounTriples_BNC, mode == "written")

## ------------------------------------------------------------------------
subset(Triples, noun == "dog" & verb == "walk")

## ------------------------------------------------------------------------
VObj <- dsm(target=Triples$noun, feature=Triples$verb, score=Triples$f, raw.freq=TRUE)
dim(VObj)

## ------------------------------------------------------------------------
subset(VObj$rows, rank(-f) <= 6) # 6 most frequent nouns

## ------------------------------------------------------------------------
head(VObj)

## ------------------------------------------------------------------------
VObj <- subset(VObj, nnzero >= 3, nnzero >= 3, recursive=TRUE)
dim(VObj)

## ------------------------------------------------------------------------
VObj <- dsm.score(VObj, score="simple-ll", transform="log", normalize=TRUE, method="euclidean")

## ------------------------------------------------------------------------
VObj

## ------------------------------------------------------------------------
VObj300 <- dsm.projection(VObj, method="svd", n=300)
dim(VObj300)

## ---- fig.width=7, fig.height=3, echo=2----------------------------------
par(mar=c(4,4,1,1))
plot(attr(VObj300, "R2"), type="h", xlab="latent dimension", ylab="R2")

## ------------------------------------------------------------------------
pair.distances("book", "paper", VObj300, method="cosine")

## ------------------------------------------------------------------------
pair.distances("book", "paper", VObj300, method="cosine", convert=FALSE)

## ------------------------------------------------------------------------
nearest.neighbours(VObj300, "book", n=14) # reduced space

## ------------------------------------------------------------------------
nn <- nearest.neighbours(VObj, "book", n=15)    # unreduced space
names(nn)

## ---- echo=c(1,3), fig.height=4------------------------------------------
nn.mat <- nearest.neighbours(VObj300, "book", n=15, dist.matrix=TRUE)
par(mar=c(1,1,1,1))
plot(nn.mat)

## ----echo=FALSE----------------------------------------------------------
knitr::kable(RG65[seq(5, 65, 10), ])

## ------------------------------------------------------------------------
eval.similarity.correlation(RG65, VObj300, convert=FALSE, format="HW")

## ---- echo=2-------------------------------------------------------------
par(mar=c(4,4,2,1))
plot(eval.similarity.correlation(RG65, VObj300, convert=FALSE, format="HW", details=TRUE))

## ---- echo=2-------------------------------------------------------------
par(mar=c(4,4,2,1))
plot(eval.similarity.correlation(RG65, DSM_Vectors, convert=FALSE, details=TRUE))

## ------------------------------------------------------------------------
Vessel <- subset(SemCorWSD, target == "vessel" & pos == "n")
table(Vessel$gloss)

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(Vessel[, c("sense", "sentence")], row.names=FALSE)

## ------------------------------------------------------------------------
centroids <- context.vectors(DSM_Vectors, Vessel$lemma, row.names=Vessel$id)

## ---- echo=2:4-----------------------------------------------------------
par(mar=c(2, 2, 2, 1))
library(cluster) # clustering algorithms of Kaufman & Rousseeuw (1990)
res <- pam(dist.matrix(centroids), 2, diss=TRUE, keep.diss=TRUE)
plot(res, col.p=factor(Vessel$sense), shade=TRUE, which=1, main="WSD for 'vessel'")

## ---- echo=1, eval=2-----------------------------------------------------
table(res$clustering, Vessel$sense)
knitr::kable(table(res$clustering, Vessel$sense))

## ------------------------------------------------------------------------
eval.clustering(Vessel, M=centroids, word.name="id", class.name="sense")

## ------------------------------------------------------------------------
mouse <- VObj300["mouse", ] # extract row vectors from matrix
computer <- VObj300["computer", ]

## ------------------------------------------------------------------------
nearest.neighbours(VObj300, "mouse", n=12)

## ------------------------------------------------------------------------
nearest.neighbours(VObj300, mouse + computer, n=12)

## ------------------------------------------------------------------------
nearest.neighbours(VObj300, mouse * computer, n=12)

