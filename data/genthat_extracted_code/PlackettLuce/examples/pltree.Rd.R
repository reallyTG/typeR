library(PlackettLuce)


### Name: pltree
### Title: Plackett-Luce Trees
### Aliases: pltree predict.pltree AIC.pltree

### ** Examples

# Bradley-Terry example

if (require(psychotree)){
    ## Germany's Next Topmodel 2007 data
    data("Topmodel2007", package = "psychotree")
    ## convert paircomp object to grouped rankings
    R <- as.grouped_rankings(Topmodel2007$preference)
    ## rankings are grouped by judge
    print(R[1:2,], max = 6)
    ## Topmodel2007[, -1] gives covariate values for each judge
    head(Topmodel2007[, -1], 2)

    ## fit partition model based on all variables except preference
    ## set npseudo = 0 as all judges rank all models
    tm_tree <- pltree(R ~ ., data = Topmodel2007[, -1], minsize = 5,
                      npseudo = 0)

    ## plot shows abilities constrained to sum to 1
    plot(tm_tree, abbreviate = 1, yscale = c(0, 0.5))
    ## instead show log-abilities with Anja as reference (need to used index)
    plot(tm_tree, abbreviate = 1, worth = FALSE, ref = 6,
         yscale = c(-1.5, 2.2))

    ## log-abilities, zero sum contrast
    itempar(tm_tree, log = TRUE)
    ## abilities with Anja as reference
    itempar(tm_tree, ref = "Anja")

    ## results for the first three judges
    newdata <- Topmodel2007[1:3,]
    ### fitted probabilities
    predict(tm_tree, newdata)
    ### fitted log-abilities, with Anni as reference
    predict(tm_tree, newdata, log = TRUE, ref = "Anni")
    ###  item ranks
    predict(tm_tree, newdata, type = "rank")
    ### top ranked item
    predict(tm_tree, newdata, type = "best")
    ### node the judge belongs to
    predict(tm_tree, newdata, type = "node")

}



