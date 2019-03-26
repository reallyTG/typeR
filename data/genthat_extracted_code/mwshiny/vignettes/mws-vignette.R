## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  # collapse = FALSE,
  # comment = "#>"
  results = "hold"
)

## ----load----------------------------------------------------------------
# load libraries
# note that attaching mwshiny also attaches shiny
library(mwshiny) # our multiwindow app
library(ggplot2) # cool visualizations
library(datasets) # contains the iris dataset

data(iris) # load iris data
summary(iris) # just to get a look at what we're dealing with here


## ----ui------------------------------------------------------------------
# vector of strings that are the names of my windows
win_titles <- c("Controller","Scatter")

ui_win <- list()

# first we add what we want to see in the controller to the list
ui_win[[1]] <- fluidPage(
  titlePanel("Iris Dataset Explorer: Controller"),
  sidebarLayout(
    sidebarPanel(
      # choose what goes on the x axis
      selectInput(inputId = "x_axis",
                  label = "What would you like to see on the x axis?",
                  choices = colnames(iris)[colnames(iris)!="Species"]),
      # choose what goes on the y axis
      selectInput(inputId = "y_axis",
                  label = "What would you like to see on the y axis?",
                  choices = colnames(iris)[colnames(iris)!="Species"]),
      # choose which groups you want to see
      checkboxGroupInput(inputId = "spec",
                         label = "Which species would you like to see?",
                         choices = as.character(unique(iris$Species)),
                         selected = as.character(unique(iris$Species))),
      # only build the scatter plot when this is clicked
      actionButton(inputId = "go",
                   label = "Build!")
    ),
    # just an empty main panel
    mainPanel()
  )
)

# then we add what we want to see in the scatter section
ui_win[[2]] <- fluidPage(
  titlePanel("Iris Dataset Explorer: Scatter"),
  plotOutput(outputId = "iris_scatter")
)


## ----serv_calc-----------------------------------------------------------
# setting up the list of calculations I want to do
serv_calc <- list()

# I only want to build a scatterplot when I click my build button, so my list will be of length 1
serv_calc[[1]] <- function(input,calc){
  # this is going to activate any time I press "build!"
  observeEvent(input()$go, {
    # create our data frame for visualizing
    sub.df <- data.frame("x" = iris[iris$Species %in% input()$spec,input()$x_axis],
                         "y" = iris[iris$Species %in% input()$spec,input()$y_axis],
                         "species"=iris[iris$Species %in% input()$spec,"Species"])
    
    # add this to calc, since we want to use this in our rendering
    calc[["sub.df"]] <- sub.df
  })
}


## ----serv_out------------------------------------------------------------
# set up our serv_out list
serv_out <- list()

# we're just rendering our scatter plot based on the iris dataset
# note the name is the same as the outputid
serv_out[["iris_scatter"]] <- function(input,calc){
  renderPlot({
    if (!is.null(calc$sub.df)){
      # build scatterplot
      ggplot(calc$sub.df, aes(x, y, color = factor(species)))+
        geom_point()+ # make scatter
        ggtitle("Iris Comparisons")+ # add title
        xlab(input$x_axis)+ # change x axis label
        ylab(input$y_axis)+ # change y axis label
        labs(color="species")+ # change legend label
        NULL
    }
  })
}

## ----mwsapp, eval=F------------------------------------------------------
#  #run!
#  mwsApp(win_titles, ui_win, serv_calc, serv_out)

## ---- out.width="400px", fig.align='center', echo=F----------------------
knitr::include_graphics("figures/selector.png")

## ---- out.width="325px", fig.show="hold",echo=F--------------------------
knitr::include_graphics(c("figures/controller_init.png", "figures/scatter_init.png"))

## ---- out.width="325px", fig.show="hold", echo=F-------------------------
knitr::include_graphics(c("figures/controller_edit.png", "figures/scatter_edit.png"))

