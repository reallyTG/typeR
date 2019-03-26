library(geomnet)


### Name: geom_net
### Title: Networks
### Aliases: GeomNet StatNet geom_net stat_net
### Keywords: datasets

### ** Examples

## Not run: 
##D library(geomnet)
##D data(blood)
##D p <- ggplot(data = blood$edges, aes(from_id = from, to_id = to))
##D p + geom_net(vertices=blood$vertices, aes(colour=..type..)) + theme_net()
##D 
##D bloodnet <- fortify(as.edgedf(blood$edges), blood$vertices)
##D p <- ggplot(data = bloodnet, aes(from_id = from_id, to_id = to_id))
##D p + geom_net()
##D p + geom_net(aes(colour=rho)) + theme_net()
##D p + geom_net(aes(colour=rho), labelon=TRUE, vjust = -0.5)
##D p + geom_net(aes(colour=rho, linetype = group_to, label = from_id),  
##D              vjust=-0.5, labelcolour="black", directed=TRUE) + 
##D      theme_net()
##D p + geom_net(colour = "orange", layout.alg = 'circle', size = 6)
##D p + geom_net(colour = "orange", layout.alg = 'circle', size = 6, linewidth=.75)
##D p + geom_net(colour = "orange", layout.alg = 'circle', size = 0, linewidth=.75,
##D              directed = TRUE)
##D p + geom_net(aes(size=Predominance, colour=rho, shape=rho, linetype=group_to),
##D              linewidth=0.75, labelon =TRUE, labelcolour="black") +
##D     facet_wrap(~Ethnicity) +
##D     scale_colour_brewer(palette="Set2")
##D gg <- ggplot(data = blood$edges, aes(from_id = from, to_id = to)) +
##D   geom_net(colour = "darkred", layout.alg = "circle", labelon=TRUE, size = 15,
##D          directed = TRUE, vjust = 0.5, labelcolour = "grey80",
##D          arrowsize = 1.5, linewidth = 0.5, arrowgap = 0.05,
##D          selfloops = TRUE, ecolour = "grey40") +
##D   theme_net()
##D gg
##D dframe <- ggplot_build(gg)$data[[1]] # contains calculated node and edge values
##D 
##D #Madmen Relationships
##D data(madmen)
##D MMnet <- fortify(as.edgedf(madmen$edges), madmen$vertices)
##D p <- ggplot(data = MMnet, aes(from_id = from_id, to_id = to_id))
##D p + geom_net(labelon=TRUE)
##D p + geom_net(aes(colour=Gender), size=6, linewidth=1, labelon=TRUE, fontsize=3, labelcolour="black")
##D p + geom_net(aes(colour=Gender), size=6, linewidth=1, labelon=TRUE, labelcolour="black") +
##D     scale_colour_manual(values=c("#FF69B4", "#0099ff")) + xlim(c(-.05,1.05))
##D p + geom_net(aes(colour=Gender), size=6, linewidth=1, directed=TRUE, labelon=TRUE,
##D              arrowgap=0.01, labelcolour="black") +
##D     scale_colour_manual(values=c("#FF69B4", "#0099ff")) + xlim(c(-.05,1.05))
##D 
##D p <- ggplot(data = MMnet, aes(from_id = from_id, to_id = to_id))
##D # alternative labelling: specify label aesthetic.
##D p + geom_net(aes(colour=Gender, label=Gender), size=6, linewidth=1, fontsize=3,
##D              labelcolour="black")
##D 
##D ## visualizing ggplot2 theme elements
##D data(theme_elements)
##D TEnet <- fortify(as.edgedf(theme_elements$edges[,c(2,1)]), theme_elements$vertices)
##D ggplot(data = TEnet, aes(from_id = from_id, to_id = to_id)) +
##D   geom_net(labelon=TRUE, vjust=-0.5)
##D 
##D ## emails example from VastChallenge 2014
##D # care has to be taken to make sure that for each panel all nodes are included with
##D # the necessary information.
##D # Otherwise line segments show on the plot without nodes.
##D emailedges <- as.edgedf(subset(email$edges, nrecipients < 54))
##D emailnet <- fortify(emailedges, email$nodes)
##D #no facets
##D ggplot(data = emailnet, aes(from_id = from_id, to_id = to_id)) +
##D   geom_net(aes(colour= CurrentEmploymentType), linewidth=0.5) +
##D   scale_colour_brewer(palette="Set2")
##D #facet by day
##D 
##D emailnet <- fortify(emailedges, email$nodes, group = "day")
##D ggplot(data = emailnet, aes(from_id = from, to_id = to_id)) +
##D   geom_net(aes(colour= CurrentEmploymentType), linewidth=0.5, fiteach=TRUE) +
##D   scale_colour_brewer(palette="Set2") +
##D   facet_wrap(~day, nrow=2) + theme(legend.position="bottom")
##D ggplot(data = emailnet, aes(from_id = from, to_id = to_id)) +
##D   geom_net(aes(colour= CitizenshipCountry), linewidth=0.5, fiteach=TRUE) +
##D   scale_colour_brewer(palette="Set2") +
##D   facet_wrap(~day, nrow=2) + theme(legend.position="bottom")
##D ggplot(data = emailnet, aes(from_id = from, to_id = to_id)) +
##D   geom_net(aes(colour= CurrentEmploymentType), linewidth=0.5, fiteach=FALSE) +
##D   scale_colour_brewer(palette="Set2") +
##D   facet_wrap(~day, nrow=2) + theme(legend.position="bottom")
##D 
##D ## Les Miserables example
##D data(lesmis)
##D lesmisnet <- fortify(as.edgedf(lesmis$edges), lesmis$vertices[, c(2,1)])
##D p <- ggplot(data=lesmisnet, aes(from_id=from_id, to_id=to_id))
##D p + geom_net(layout.alg="fruchtermanreingold")
##D p + geom_net(layout.alg="fruchtermanreingold", labelon=TRUE, vjust=-0.5)
##D p + geom_net(layout.alg="fruchtermanreingold", labelon=TRUE, vjust=-0.5,
##D     aes(linewidth=degree/5))
##D 
##D ## College Football Games in the Fall 2000 regular season
##D # Source: http://www-/personal.umich.edu/~mejn/netdata/
##D data(football)
##D ftnet <- fortify(as.edgedf(football$edges), football$vertices)
##D p <- ggplot(data=ftnet, aes(from_id=from_id, to_id=to_id))
##D p + geom_net(aes(colour=value), linewidth=0.75, size=4.5, ecolour="grey80") +
##D   scale_colour_brewer("Conference", palette="Paired") + theme_net() +
##D   theme(legend.position="bottom")
##D   
## End(Not run)



