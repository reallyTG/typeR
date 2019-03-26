# phylotate
# Copyright (c) 2017 Daniel Beer
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

library(phylotate)

test.eq.phylo <- function (test.data, test.data2) {
    for (e in c("edge", "edge.length", "Nnode", "tip.label",
		"node.comment", "node.distance.comment")) {
	e1 <- test.data[[e]]
	e2 <- test.data2[[e]]
	r <- test.data[[e]] != test.data2[[e]]
	r[is.na(e1)] <- TRUE
	r[is.na(e2)] <- TRUE
	r[is.na(e1) & is.na(e2)] <- FALSE
	if (sum(r) > 0) {
	    print("")
	    print(e1)
	    print(e2)
	    stop(sprintf("%s doesn't match", e))
	}
    }
}

test.newick <- function () {
    test.str <- paste0(
	"(1[Z]:100[Q],((11,((8,(7,(6,(5,(4,(2:200,3:300)))))),(9,10))),",
	"((22,((18,(17,(16,",
	"(15,(14,(12,13)))))),(21:2100,(19,20)))),(23,24))),(53,(52,(((27,",
	"(25,26)),(30,(28,29))),(((41[X]:4100[D],(40,(39,(((31,(34,(32,33))),",
	"(35,36)),(37[Y],38))))),((44,(42,43[A])),(45,46))),(51,(50,(49,(47,",
	"48)))))))))[XYZ]")
    print(test.str)

    test.data <- parse_annotated(test.str, format="newick")
    str(test.data)

    test.str2 <- print_annotated(test.data, format="newick")
    print(test.str2)
    if (test.str != test.str2) { stop("Strings don't match!") }

    test.data2 <- parse_annotated(test.str2, format="newick")
    str(test.data2)

    test.eq.phylo(test.data, test.data2)

    print("All ok")
}

test.nexus <- function () {
    data(finches)

    test <- parse_annotated(finches, format="nexus")
    str(test)
    test$edge.length <- round(test$edge.length * 100)
    if (length(test$tip.label) < 1) {
	stop("missing tips")
    }

    n1 <- print_annotated(test, format="nexus")
    print(n1)

    p1 <- parse_annotated(n1, format="nexus")
    str(p1)

    n2 <- print_annotated(p1, format="nexus")
    if (n1 != n2) { stop("Strings don't match!") }

    p2 <- parse_annotated(n2, format="nexus")
    test.eq.phylo(p1, p2)

    print("All ok")
}

test.newick()
test.nexus()
