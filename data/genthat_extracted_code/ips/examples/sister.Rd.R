library(ips)


### Name: sister
### Title: Identification of Sister Nodes and Clades
### Aliases: sister

### ** Examples

# data
# ----
#data(vipera)
#node <- noi(vipera.ml, c("Vipera_latastei", "Vipera_aspis"))

# get the sister node of 'node'
# -----------------------------
#(sn <- sister(vipera.ml, node, type = "internal"))

# ... and the sister nodes's tips (i.e. the sister clade)
# -------------------------------------------------------
#(sc <- sister(vipera.ml, node, type = "terminal"))

# results graphically:
# --------------------
#plot(vipera.ml)
#nodelabels(text = "15", node = 15, frame = NULL, col = "white", bg = "black")
#nodelabels(text = sn, node = sn, col = "black", bg = "red")
#append2tiplabel(tree, tips = sc, pch = 21, offset = strwidth("."))



