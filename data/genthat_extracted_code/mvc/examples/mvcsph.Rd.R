library(mvc)


### Name: mvcsph
### Title: Multi-View Clustering using Spherical k-Means for categorical
###   data.
### Aliases: mvcsph

### ** Examples
{
# Demo program, showing how to run Multi-
# View Clustering using Spherical k-Means 
# AM, 2011

# load toy data 'toyView1' and 'toyView2'
data(toyViews)

mvcsph(
view1=toyView1,
view2=toyView2,
nthresh=20,
k=4,
startView="view1"
)

}


