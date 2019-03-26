library(HTMLUtils)


### Name: FramedHTML
### Title: creates a framed HTML page displaying plots and annotations
### Aliases: FramedHTML

### ** Examples



if (interactive()){  


  #example with plots and graphfiles being generated on the fly:


  owd=setwd(tempdir())


  system("mkdir Figures")


  


FramedHTML(cmds = list("plot(rnorm(100));","plot(1:10);"), 


           HTMLobjects =list("Fig1.png", "Fig2.png"), 


           Captions=c("Gaussian noise","seq 1:10"),


           MenuLabels1 = c("Label1","Label2"), 


           MenuLabels2 = c("Marvel at the graph below","scatterplots are nice"), 


           Comments  = c("100 random numbers","Simple plot"), title="Test Page",


           width=480, height=480, verbose=1)


    


    


    #example with plots and graphfiles having been generated beforehand:


    png("Fig1.png");


      plot(rnorm(100));


    dev.off()


    png("Fig2.png");


      plot(1:10);


    dev.off();


    


FramedHTML( HTMLobjects = list("Fig1.png", "Fig2.png"), 


   Captions=c("Gaussian noise","seq 1:10"), 


  MenuLabels1 = c("Label1","Label2"), 


   MenuLabels2 = c("Marvel at the graph below","scatterplots are nice"), 


   Comments  = c("100 random numbers","Simple plot"), title="Test Page",


  width=480, height=480, verbose=1);


    


    #example with absolute paths for graphfiles :


    Fig1 <- paste(tempdir(),"/Fig1.png",sep="")


    png(Fig1);


      plot(rnorm(100));


    dev.off()


    Fig2 <- paste(tempdir(),"/Fig2.png",sep="")


    png(Fig2);


      plot(1:10);


    dev.off();


    


 FramedHTML( HTMLobjects = list(Fig1, Fig2), Captions=c("Gaussian noise","seq 1:10"), 


    MenuLabels1 = c("Label1","Label2"), 


    MenuLabels2 = c("Marvel at the graph below","scatterplots are nice"), 


    Comments  = c("100 random numbers","Simple plot"), 


    title="Test Page",width=480, height=480, verbose=1);


    #cleanup:


    #system(paste("rm ", Fig1));system(paste("rm ", Fig2))


  


  #example with sorted table:


  x <- cbind.data.frame(x1 = round(rnorm(10),3), x2 = round(runif(10),3));


  attr(x, "HEADER") <- "some random numbers";


  FramedHTML(HTMLobjects = list("Fig1.png", x, "Fig2.png"), 


    MenuLabels1 = c("Label1","Label2","Label3"), 


    MenuLabels2 = c("Marvel at the graph below","JavaScript rocks","scatterplots are nice"),


    Captions=c("Gaussian noise","Gaussian and uniform random numbers", "seq 1:10"),Comments = NULL,


    path = "tmp", file = "index");





  #example with sorted tables only, no figures:


  x <- cbind.data.frame(x1 = round(rnorm(10),3), x2 = round(runif(10),3));


  attr(x, "HEADER") <- "some random numbers";


  y <- cbind.data.frame(y1 = rbinom(10,50,0.3), y2 = rbinom(10,100,0.15));


  attr(y, "HEADER") <- "rbinom";


  FramedHTML(HTMLobjects = list( x, y), 


           MenuLabels1 = c("x","y"), 


           MenuLabels2 = c("JavaScript rocks","Secret numbers"),


           Captions=c("Gaussian and uniform random numbers", "Binomial draws"),Comments = NULL,


           path = "tmp", file = "index");





  setwd(owd)


}





