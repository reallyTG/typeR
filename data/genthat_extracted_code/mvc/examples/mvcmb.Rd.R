library(mvc)


### Name: mvcmb
### Title: Multi-View Clustering using mixture of categoricals EM.
### Aliases: mvcmb

### ** Examples
{
# Demo program, showing how to run Multi-
# View Clustering using Mixture of Binomials EM.
# AM, 2011

# load toy data 'toyView1' and 'toyView2'
data(toyViews)

mvcmb(
view1=toyView1,
view2=toyView2,
nthresh=20,
k=4,
startView="view1"
)

}


