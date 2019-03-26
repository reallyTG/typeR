library(ggm)


### Name: drawGraph
### Title: Drawing a graph with a simple point and click interface.
### Aliases: drawGraph
### Keywords: graphs hplot iplot

### ** Examples

## A directed acyclic graph
d <- DAG(y1 ~ y2+y6, y2 ~ y3, y3 ~ y5+y6, y4 ~ y5+y6)
## Not run: drawGraph(d)

## An undirected graph
g <- UG(~giova*anto*armo + anto*arj*sara) 
## Not run: drawGraph(d)

## An ancestral graph
ag <- makeMG(ug=UG(~y0*y1), dg=DAG(y4~y2, y2~y1), bg=UG(~y2*y3+y3*y4))
drawGraph(ag, adjust = FALSE)
drawGraph(ag, adjust = FALSE)

## A more complex example with coordinates: the UNIX evolution
xy <-
structure(c(5, 15, 23, 25, 26, 17, 8, 6, 6, 7, 39, 33, 23, 49, 
19, 34, 13, 29, 50, 68, 70, 86, 89, 64, 81, 45, 64, 49, 64, 87, 
65, 65, 44, 37, 64, 68, 73, 85, 83, 95, 84, 0, 7, 15, 27, 44, 
37, 36, 20, 51, 65, 44, 64, 59, 73, 69, 78, 81, 90, 97, 89, 72, 
85, 74, 62, 68, 59, 52, 48, 43, 50, 34, 21, 18, 5, 1, 10, 2, 
11, 2, 1, 44), .Dim = c(41, 2), .Dimnames = list(NULL, c("x", 
"y")))
Unix <- DAG(
                SystemV.3 ~ SystemV.2,
                SystemV.2 ~ SystemV.0,
                SystemV.0 ~ TS4.0,
                TS4.0 ~ Unix.TS3.0 + Unix.TS.PP + CB.Unix.3,
                PDP11.SysV ~ CB.Unix.3,
                CB.Unix.3 ~ CB.Unix.2,
                CB.Unix.2 ~ CB.Unix.1,
                Unix.TS.PP ~ CB.Unix.3,
                Unix.TS3.0 ~ Unix.TS1.0 + PWB2.0 + USG3.0 + Interdata,
                USG3.0 ~ USG2.0,
                PWB2.0 ~ Interdata + PWB1.2,
                USG2.0 ~ USG1.0,
                CB.Unix.1 ~ USG1.0,
                PWB1.2 ~ PWB1.0,
                USG1.0 ~ PWB1.0,
                PWB1.0 ~ FifthEd,
                SixthEd ~ FifthEd,
                LSX ~ SixthEd,
                MiniUnix ~ SixthEd,
                Interdata ~ SixthEd,
                Wollongong ~ SixthEd,
                SeventhEd ~ Interdata,
                BSD1 ~ SixthEd,
                Xenix ~ SeventhEd,
                V32 ~ SeventhEd,
                Uniplus ~ SeventhEd,
                BSD3 ~ V32,
                BSD2 ~ BSD1,
                BSD4 ~ BSD3,
                BSD4.1 ~ BSD4,
                EigthEd ~ SeventhEd + BSD4.1,
                NinethEd ~ EigthEd,
                Ultrix32 ~ BSD4.2,
                BSD4.2 ~ BSD4.1,
                BSD4.3 ~ BSD4.2,
                BSD2.8 ~ BSD4.1 + BSD2,
                BSD2.9 ~ BSD2.8,
                Ultrix11 ~ BSD2.8 + V7M + SeventhEd,
                V7M ~ SeventhEd
                )
drawGraph(Unix, coor=xy, adjust=FALSE)
# dev.print(file="unix.fig", device=xfig) # Edit the graph with Xfig



