library(Diderot)


### Name: Diderot-package
### Title: Bibliographic Network Analysis Package
### Aliases: Diderot-package Diderot
### Keywords: package

### ** Examples

## Not run: 
##D   # Two corpora on individual-based modelling (IBM) and agent-based modelling (ABM)
##D   # were downloaded from Scopus. The structure of each corpus is as follows:
##D   tt<-read.csv("IBMmerged.csv", stringsAsFactors=FALSE)
##D   str(tt,strict.width="cut")
##D   ### 'data.frame':  3184 obs. of  9 variables:
##D   ### $ Authors        : chr  "Chen J., Marathe A., Marathe M." "Van Dijk D., Sl"..
##D   ### $ Title          : chr  "Coevolution of epidemics, social networks, and in"..
##D   ### $ Year           : int  2010 2010 2010 2010 2010 2010 2010 2010 2010 2010 ...
##D   ### $ DOI            : chr  "10.1007/978-3-642-12079-4_28" "10.1016/j.procs.20"..
##D   ### $ Link           : chr  "http://www.scopus.com/inward/record.url?eid=2-s2."..
##D   ### $ Abstract       : chr  "This research shows how a limited supply of antiv"..
##D   ### $ Author.Keywords: chr  "Antiviral; Behavioral economics; Epidemic; Microe"..
##D   ### $ Index.Keywords : chr  "Antiviral; Behavioral economics; Epidemic; Microe"..
##D   ### $ References     : chr  "(2009) Centre Approves Restricted Retail Sale of "..
##D   
##D   # Define the name of corpora (labels) and specific keywords to identify relevant
##D   # publications (keys).
##D   labels<-c("IBM","ABM")
##D   keys<-c("individual-based model|individual based model", 
##D           "agent-based model|agent based model")
##D   
##D   # Build the IBM-ABM bibliographical dataset from Scopus exports
##D   db<-create_bibliography(corpora_files=c("IBMmerged.csv","ABMmerged.csv"), 
##D                           labels=labels, keywords=keys)
##D   ### [1] "File IBMmerged.csv contains 3184 records"
##D   ### [1] "File ABMmerged.csv contains 9641 records"
##D   
##D   # Build and save citation graph
##D   gr<-build_graph(db=db,small.year.mismatch=T,fine.check.nb.authors=2,
##D                   attrs=c("Corpus","Year","Authors", "DOI"))
##D   ### [1] "Graph built! Execution time: 1200.22 seconds."
##D   save_graph(gr, "graph.graphml")
##D   
##D   # Compute and plot modularity
##D   compute_modularity(gr_sx, 1987, 2018)
##D   ###[1] 0.3164805
##D   plot_modularity_timeseries(gr_sx, 1987, 2018, window=1000)
##D   
##D   # Compute and plot publication heterocitation
##D   gr_sx<-precompute_heterocitation(gr,labels=labels,infLimitYear=1987, supLimitYear=2018)
##D   ###[1] "Summary of the nodes considered for computation (1987-2017)"
##D   ###[1] "-----------------------------------------------------------"
##D   ###[1] "IBM     ABM     IBM|ABM"
##D   ###[1] "1928     5378     153"
##D   ###[1]
##D   ###[1] "Edges summary"
##D   ###[1] "-------------"
##D   ###[1] "IBM->IBM/IBM->Other 5583/1086 => Prop 0.163"
##D   ###[1] "ABM->ABM/ABM->Other 16946/2665 => Prop 0.136"
##D   ###[1] "General Same/Diff 22529/3751 => Prop 0.143"
##D   ###[1]
##D   ###[1] "Heterocitation metrics"
##D   ###[1] "----------------------"
##D   ###[1] "Sx ALL /  IBM  /  ABM"
##D   ###[1] "0.127 / 0.137 / 0.124"
##D   ###[1] "Dx ALL /  IBM  /  ABM"
##D   ###[1] "-0.652 / -0.803 / -0.598"
##D   heterocitation(gr_sx, labels=labels, 1987, 2005)
##D   ###[1] "Sx ALL /  ABM  /  IBM"
##D   ###[1] "0.047 / 0.214 / 0.007"
##D   ###[1] "Dx ALL /  ABM  /  IBM"
##D   ###[1] "-0.927 / -0.690 / -0.982"
##D   plot_heterocitation_timeseries(gr_sx, labels=labels, mini=-1, maxi=-1, cesure=2005)
##D 
##D   # Compute author heterocitation
##D   hetA<-heterocitation_authors(gr_sx, 1987, 2018, pub_threshold=4)
##D   head(hetA[order(hetA$avgDx,decreasing=T),c(1)], n=10)
##D   ### [1] "Ashlock D." "Evora J." "Hernandez J.J." "Hernandez M." "Gooch K.J."          
##D   ### [6] "Reinhardt J.W." "Ng K." "Kazanci C." "Senior A.M." "Ariel G." 
##D   
##D   # Try to figure which publication are most impactful in terms of cross-fertilization
##D   jir<-compute_Ji_ranking(gr_sx, labels=labels, 1987, 2018)
##D   head(jir[,c(2,7)],n=3)
##D   ###         Title                                                                           Ji
##D   ### 758     A standard protocol for describing individual-based and agent-based models      200
##D   ### 4437    Pattern-oriented modeling of agent-based complex systems: Lessons from ecology  134
##D   ### 33      The ODD protocol: A review and first update                                     120
## End(Not run)



