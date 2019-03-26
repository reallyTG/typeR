library(cooccurNet)


### Name: cooccurNet
### Title: cooccurNet: Co-Occurrence network computation for R
### Aliases: cooccurNet

### ** Examples

  #example of get example data
  dataFile=getexample(dataType="protein")

  #example of get file paths for all the files available for testing RCOS.
  #dataFiles = getexample_forRCOS()

  #example of readseq()
  #read sequences from the sample fasta file
  #data = readseq(dataFile=dataFile, dataType="protein")

  #example of pprocess()
  #preprocess the sequence dataFile
  #data_process = pprocess(data=data,conservativeFilter=0.95)

  #example of gencooccur()
  #generate co-occurrence network and save it into the 'networkFile'
  #cooccurNetwork  = gencooccur(data=data_process, cooccurFilter=0.9, networkFile='cooccurNetwork')
  #check the 'networkFile' path
  #print(cooccurNetwork$networkFile)

  #example of coocnet()
  #also, you can generate the co-occurrence network by one command
  #cooccurNetwork  = coocnet(dataFile=getexample(dataType="protein"), dataType="protein")
  #check the 'networkFile' path
  #print(cooccurNetwork$networkFile)

  #example of siteco()
  #you can generate the co-occurrence network siteCoFile by one command
  #this command will take long time to calculate the p-value.
  #pairwiseCooccur = siteco(dataFile=getexample(dataType="protein"), dataType="protein")
  #check the 'siteCoFile' path
  #print(pairwiseCooccur$siteCoFile)

  #example of toigraph()
  #you can transform a network file to the igraph.data.frame
  #cooccurNetwork  = coocnet(dataFile=getexample(dataType="protein"),dataType="protein")
  #get igraph data frame by specifying the network name
  #network_igraph = toigraph(networkFile=cooccurNetwork$networkFile, networkName=c("EPI823725"))
  #Plot the network (The package "igraph" must be installed and loaded firstly)
  #read the names of network
  #networkName = cooccurNetwork$xnames
  #Transform all cooccurrence network into the igraph format
  #Network_igraph = toigraph(networkFile=cooccurNetwork$networkFile, networkNames=networkName)

  #example of changelog()
  #logs = changeLog(n=20)





