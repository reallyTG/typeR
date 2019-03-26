# ------------------------------------------------------------------------
newick1 <- "((A:1,B:1):2,C:3);"
newick2 <- "((A:2,B:2):1,C:3);"
phylogeny1 <- ape::read.tree(text = newick1)
phylogeny2 <- ape::read.tree(text = newick2)

# ------------------------------------------------------------------------
ape::plot.phylo(phylogeny1)
ape::add.scale.bar() #nolint

# ------------------------------------------------------------------------
nLTT::nltt_plot(phylogeny1, ylim = c(0, 1))

# ------------------------------------------------------------------------
ape::plot.phylo(phylogeny2)
ape::add.scale.bar() #nolint

# ------------------------------------------------------------------------
nLTT::nltt_plot(phylogeny2, ylim = c(0, 1))

# ------------------------------------------------------------------------
nLTT::nltts_plot(c(phylogeny1, phylogeny2), dt = 0.20, plot_nltts = TRUE)

# ------------------------------------------------------------------------
newick1 <- "((A:1,B:1):1,(C:1,D:1):1);"
newick2 <- paste0("((((XD:1,ZD:1):1,CE:2):1,(FE:2,EE:2):1):4,((AE:1,BE:1):1,",
  "(WD:1,YD:1):1):5);"
)
phylogeny1 <- ape::read.tree(text = newick1)
phylogeny2 <- ape::read.tree(text = newick2)

# ------------------------------------------------------------------------
ape::plot.phylo(phylogeny1)
ape::add.scale.bar() #nolint

# ------------------------------------------------------------------------
nLTT::nltt_plot(phylogeny1, ylim = c(0, 1))

# ------------------------------------------------------------------------
ape::plot.phylo(phylogeny2)
ape::add.scale.bar() #nolint

# ------------------------------------------------------------------------
nLTT::nltt_plot(phylogeny2, ylim = c(0, 1))

# ------------------------------------------------------------------------
nLTT::nltts_plot(
  c(phylogeny1, phylogeny2),
  dt = 0.20,
  plot_nltts = TRUE
)
