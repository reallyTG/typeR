## ----eggs_in_a_funnel, fig.width=6, fig.height=3-------------------------
plot(1/sqrt(egg_data$VZr), egg_data$Zr, pch=16,
     ylab="Effect size (Zr)",
     xlab="Precision (1/SE)",
     main="Effect sizes for sex bias in egg size among 51 brid species" )

## ---- clean_eggs---------------------------------------------------------
egg_data <- as.data.frame(egg_data)
egg_data$animal <- tolower(egg_data$animal)

## ----bird_map------------------------------------------------------------
taxon_map <- structure(taxa$search_string, names=taxa$unique_name)

## ----odd_duck------------------------------------------------------------
taxon_map["Anser caerulescens"]

## ----birds_in_a_tree, fig.width=5, fig.height=5, fig.align='center'------
tr <- tol_induced_subtree(ott_id(taxa)[is_in_tree(ott_id(taxa))])
plot(tr, show.tip.label=FALSE)

## ----tip_lab-------------------------------------------------------------
tr$tip.label[1:4]

## ----clean_tips----------------------------------------------------------
otl_tips <- strip_ott_ids(tr$tip.label, remove_underscores=TRUE)
tr$tip.label <- taxon_map[ otl_tips ]

## ----remove_nodes--------------------------------------------------------
tr$node.label <- NULL

## ----match_species_tree--------------------------------------------------
egg_data <- egg_data[egg_data$animal %in% tr$tip.label, ]

## ----model---------------------------------------------------------------
set.seed(123)
if (require(MCMCglmm, quietly = TRUE)) {

    pr <- list(R=list(V=1,nu=0.002),
               G=list(G1=list(V=1,nu=0.002))
               )

    model <- MCMCglmm(Zr~1,random=~animal,
                      pedigree=tr,
                      mev=egg_data$VZr,
                      prior=pr,
                      data=egg_data,
                      verbose=FALSE)
} else {
    model <- readRDS(file = system.file("extdata", "mcmcglmm_model.rds", package = "rotl"))
}

## ----PhyH----------------------------------------------------------------
var_comps <- colMeans(model$VCV )
var_comps["animal"] / sum(var_comps)

