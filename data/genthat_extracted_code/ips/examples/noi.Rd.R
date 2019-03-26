library(ips)


### Name: noi
### Title: Identification of MRCAs for Clades
### Aliases: noi

### ** Examples

# molecular phylogeny of Eurasian vipers:
# ---------------------------------------
#data(viperidae)	
#gen <- sapply(viperidae$tip.label, function(x) unlist(strsplit(x, "_"))[1])
#tax <- data.frame(genus = gen, species = viperidae$tip.label, row.names = NULL)

# group be a data frame
# ----------------------------------------------------
## .. to be added ..

# group can be a list
# -------------------
#myclades <- split(tax$species, tax$genus)
#nds <- noi(viperidae, myclades)
#plot(viperidae)
#nodeInfo(nds)

# group might contain tip numbers
# -------------------------------
#group <- list(c(17, 22), c(13, 1))
#plot(viperidae)
#append2tips(phy, tips = unlist(group), pch = 19)
#nds <- noi(viperidae, myclades)
#nodeInfo(nds)

# the 'group' argument can also take regular expressions
# ------------------------------------------------------
#rex <- "aspis"
#node <- noi(viperidae, rex, regex = TRUE)
#plot.phylo(viperidae, tip.color = 0, edge.color = 0)
#box.clades(viperidae, nodes = node, col = "#D2A6A7", align = "all")
#plot.phylo.upon(viperidae)
#nodelabels(node = node, pch = 21, cex = 1.2, col = "red", bg = "#D2A6A7")

# if the 'group' argument is a list of elements of length 2,
# n = length(group) nodes of interest will be returned
# ----------------------------------------------------
#group <- list(
#    c("Vipera_berus", "Vipera_ursinii"),
#    c("Vipera_aspis_ssp._aspis", "Vipera_latastei"),
#    c("Vipera_ammodytes_ssp._ammodytes", 
#        "Vipera_ammodytes_ssp._montandoni"),
#    c("Macrovipera_lebetina", "Vipera_wagneri")
#)
#clades <- noi(viperidae, group)
#plot.phylo(viperidae, tip.color = 0, edge.color = 0)
#box.clades(viperidae, nodes = clades, col = c("#FFFFA5", "#D2A6A7",
#    "#A7D2A5", "#A5A6D2"), align = "all")
#plot.phylo.upon(viperidae)



