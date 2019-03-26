library(c060)


### Name: aggregation.auc
### Title: Determine the area under the ROC curve for a fitted model
### Aliases: aggregation.auc
### Keywords: models regression classification

### ** Examples

## Not run: 
##D # binomial model - classification
##D 
##D library(c060)
##D library(gridExtra)
##D library(ggplot2)
##D 
##D set.seed(0815)
##D x <- matrix(rnorm(100*20),100,20)
##D y <- sample(0:1,100,replace=TRUE)
##D 
##D peperr_obj <- peperr(response=y, x=x, fit.fun=fit.glmnet, args.fit=list(family="binomial"),
##D            complexity=complexity.glmnet, args.complexity=list(nfolds=10, family="binomial"),
##D            trace=F, RNG="fixed",seed=0815,
##D #           aggregation.fun=c060:::aggregation.misclass,                  
##D #           aggregation.fun=c060:::aggregation.brier,                  
##D            aggregation.fun=c060:::aggregation.auc,                  
##D            indices=resample.indices(n=nrow(x), sample.n = 100, method = "sub632"))
##D 
##D tmp   <- data.frame(grp="",error=unlist(peperr_obj$sample.error)) 
##D errs  <- data.frame(error=c(perr(peperr_obj,"resample"),
##D          perr(peperr_obj,"632p"),perr(peperr_obj,"app"),
##D          perr(peperr_obj,"nullmodel")), col  = c("red","blue","green","brown"),
##D          row.names=c("mean\nout-of-bag",".632plus","apparent","null model"))
##D                  
##D p     <- ggplot(tmp, aes(grp,error))
##D pg    <- p + geom_boxplot(outlier.colour = rgb(0,0,0,0), outlier.size=0) +
##D          geom_jitter(position=position_jitter(width=.1)) + 
##D          theme_bw() + scale_y_continuous("AUC") +  scale_x_discrete("") +
##D          geom_hline(aes(yintercept=error, colour=col), data=errs, show_guide=T) + 
##D          scale_colour_identity("error type", guide = "legend", breaks=errs$col,
##D          labels=rownames(errs)) +
##D          ggtitle("AUC \n in bootstrap samples ")                       
##D 
##D p2     <- ggplot(data.frame(complx=peperr_obj$sample.complexity), aes(x=complx))
##D pg2    <- p2 + geom_histogram(binwidth = 0.02, fill = "white", colour="black") +
##D           theme_bw()+  xlab(expression(lambda)) +
##D           ylab("frequency") + 
##D           geom_vline(xintercept=peperr_obj$selected.complexity, colour="red") + 
##D           ggtitle("Selected complexity \n in bootstrap samples") +
##D           ggplot2::annotate("text", x = 0.12, y = -0.5,
##D           label = "full data", colour="red", size=4)
##D 
##D grid.arrange(pg2, pg, ncol=2)
##D 
## End(Not run)


