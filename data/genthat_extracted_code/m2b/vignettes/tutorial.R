## ----echo=F--------------------------------------------------------------
knitr::opts_chunk$set(dev='png')

## ----diag,warn=FALSE,cache=TRUE,echo=FALSE,eval=F,fig.cap="Schematic of the work flow from the raw data to the results. The `legend` box provides the symbolic representation (shape and color) of the different objects. The arrows between boxes represent the use of the package functions and methods: in blue the computation of the data, in red the modelling, in green the outputs and in pink the export to the ltraj format (adehabitat package). The diamond boxes inside the `xytb object` box represent the slots of the classi (dotted lines link the xytb class and the slots). Diagram generated using Graphviz."----
#  DiagrammeR::grViz(width=800,height=800,diagram="
#  	digraph rmarkdown {
#  	graph[center=true,ratio=auto,rankdir=TD,compound=true];
#  
#  	fieldwork[label='Fieldwork',color=white];
#  	fieldwork->behaviour[lhead=cluster0];
#  	fieldwork->descdata[lhead=cluster0];
#  	fieldwork->track[lhead=cluster0];
#  
#  	subgraph cluster0{
#  		track[label='track data'];
#  		behaviour[label='behavioural data'];
#  		descdata[label='meta data'];
#  		label = 'data';
#  	}
#  	descdata->desc[fontcolor=blue,color=blue];
#  	behaviour->b[fontcolor=blue,color=blue];
#  	track->xyt[fontcolor=blue,color=blue];
#  
#  	subgraph cluster1 {
#  		xytb[label='class xytb',shape=diamond];
#  		xytb-> desc[type=tee,style=dotted,dir=none];
#  		xytb-> xyt[type=tee,style=dotted,dir=none];
#  		xytb-> b[type=tee,style=dotted,dir=none];
#  		xytb-> dxyt[type=tee,style=dotted,dir=none];
#  		xytb-> befdxyt[type=tee,style=dotted,dir=none];
#  		xytb-> model[type=tee,style=dotted,dir=none];
#  		xytb-> rfcv[type=tee,style=dotted,dir=none];
#  		xytb-> predb[type=tee,style=dotted,dir=none];
#  
#  		xyt->dxyt->befdxyt[color=blue,style=dashed];
#  		b->model[color=red,style=dashed];
#  		dxyt->model[color=red,style=dashed];
#  		befdxyt->model[color=red,style=dashed];
#  		model->predb[color=red,style=dashed];
#  		rfcv->model[dir=both,color=red];
#  		desc[shape=diamond,label='@desc:\nshort\ndescription']
#  		xyt[shape=diamond,label='@xyt:\ntrack']
#  		b[shape=diamond,label='@b:\nbehaviour']
#  		dxyt[shape=diamond,label='@dxyt:\ntrack\nderivative']
#  		befdxyt[shape=diamond,label='@befdxyt:\n@dxyt\nshifted']
#  		model[shape=diamond,label='@model:\nrandom forest\nmodel']
#  		rfcv[shape=diamond,label='@rfcv:\ncross validation\nof @model']
#  		predb[shape=diamond,label='@predb:\nprediction of \n@b using @model']
#  		label = 'xytb object';
#  	}
#  
#  	subgraph cluster3 {
#  		label='Results';
#  		Plots[shape=box];
#  		Tables[shape=box];
#  	}
#  
#  	xytb->Plots[color=green];
#  	xytb->Tables[color=green];
#  
#  	ltraj[label='ltraj object',shape=diamond];
#  	xytb->ltraj[color=pink,dir=both];
#  	hmm[label='moveHMM object',shape=diamond];
#  	xytb->hmm[color=pink,dir=both];
#  
#  	subgraph cluster100 {
#  		label='Legend'
#  		out[label='Output',shape=box];
#  		R[label='R object',shape=diamond];
#  		slot[label='slot',shape=diamond];
#  		fun[label='Functions\n& Methods',color=white];
#  		leg1[label='xytb()',color=blue,fontcolor=blue];
#  		leg2[label='modelRF()',color=red,fontcolor=red];
#  		leg3[label='resRF()\n resB()',color=green,fontcolor=green];
#  		leg4[label='xytb2ltraj()\n ltraj2xytb()\n xytb2hmm()',color=pink,fontcolor=pink];
#  		fun->leg1[color=blue];
#  		fun->leg2[color=red];
#  		fun->leg3[color=green];
#  		fun->leg4[color=pink];
#  		R->slot[style=dotted,dir=none];
#  		file[label='Data'];
#  	}
#  
#  
#  }")
#  
#  

## ----data1,warn=FALSE,cache=TRUE,echo=TRUE-------------------------------
library(m2b)
str(track_CAGA_005)

## ----data2,warning=FALSE,cache=TRUE,echo=TRUE----------------------------
library(m2b)
#convert to xybt object with computation of windows operators and some quantiles
xytb<-xytb(track_CAGA_005,desc="example track",
	 winsize=seq(3,15,2),idquant=seq(0,1,.25),move=c(5,10,15))
#a simple plot method
plot(xytb)

## ----model1,warn=FALSE,cache=TRUE,echo=TRUE------------------------------
#a model (the function modelRF updates the model inside the xytb object)
xytb<-modelRF(xytb,type="actual",ntree=501,mtry=15)

## ----model2,warn=FALSE,cache=TRUE,echo=TRUE------------------------------
resRF(xytb)
resRF(xytb,"importance")
resRF(xytb,"confusion")

## ----res1,warn=FALSE,cache=TRUE,echo=TRUE--------------------------------
resB(xytb,"time",nob="-1")
resB(xytb,"space",nob="-1")
resB(xytb,"density",nob="-1")

