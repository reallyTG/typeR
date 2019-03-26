library(HTMLUtils)


### Name: BasicHTML
### Title: creates a basic HTML page displaying plots and annota
### Aliases: BasicHTML

### ** Examples



  if (interactive()){  


  owd=setwd(tempdir())


  BasicHTML(cmds = list("plot(rnorm(100));","plot(1:10);"), 


            HTMLobjects = list("Fig1.png", "Fig2.png"), 


            Captions=c("Gaussian noise","seq 1:10"),  


            MenuLabels = c("Marvel at the graph below","scatterplots are nice"), 


            title="Test Page",width=480, height=480, verbose=1, JSCPATH = NULL)


                      


    #example with plots and graphfiles having been generated beforehand:


    png("Fig1.png");


      plot(rnorm(100));


    dev.off()


    png("Fig2.png");


      plot(1:10);


    dev.off();


    


BasicHTML( HTMLobjects = list("Fig1.png", "Fig2.png"), 


  Captions=c("Gaussian noise","seq 1:10"), 


   MenuLabels = c("Marvel at the graph below","scatterplots are nice"), 


  title="Test Page",


  width=480, height=480, verbose=1, JSCPATH = NULL);


    


    #example with absolute paths for graphfiles :


    Fig1 <- paste(tempdir(),"/Fig1.png",sep="")


    png(Fig1);


      plot(rnorm(100));


    dev.off()


    Fig2 <- paste(tempdir(),"/Fig2.png",sep="")


    png(Fig2);


      plot(1:10);


    dev.off();


    


BasicHTML( HTMLobjects = list(Fig1, Fig2), 


    Captions=c("Gaussian noise","seq 1:10"),  


    MenuLabels = c("Marvel at the graph below","scatterplots are nice"), title="Test Page",


    width=480, height=480, verbose=1, JSCPATH = NULL);


    #cleanup:


    #system(paste("rm ", Fig1));system(paste("rm ", Fig2))





  #example with sorted table:


  x <- cbind.data.frame(x1 = round(rnorm(10),3), x2 = round(runif(10),3));


  attr(x, "HEADER") <- "some random numbers";


  BasicHTML(HTMLobjects = list("Fig1.png", x, "Fig2.png"), 


            Captions=c("Gaussian noise","Gaussian and uniform random numbers", "seq 1:10"), 


            file = paste(Sys.getenv("HOME"), "/public_html/tmp/tmp.html",sep=""), 


            JSCPATH = "../jsc");


  setwd(owd)


}





