## ---- echo = FALSE-------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  purl = NOT_CRAN,
  eval = NOT_CRAN
)

## ----load-package--------------------------------------------------------
suppressWarnings(suppressMessages(library(dplyr)))
suppressWarnings(suppressMessages(library(lubridate)))
library(rdfp)
options(rdfp.network_code = 123456789)

## ----other-params, eval=FALSE--------------------------------------------
#  options(rdfp.application_name = "MyApp")
#  options(rdfp.client_id = "012345678901-99thisisatest99.apps.googleusercontent.com")
#  options(rdfp.client_secret = "Th1s1sMyC1ientS3cr3t")
#  
#  dfp_auth()

## ----auth, include = FALSE-----------------------------------------------
library(here)
token_path <- here::here("tests", "testthat", "rdfp_token.rds")
suppressMessages(dfp_auth(token = token_path, verbose = FALSE))
options_path <- here::here("tests", "testthat", "rdfp_options.rds")
rdfp_options <- readRDS(options_path)
options(rdfp.network_code = rdfp_options$network_code)

## ------------------------------------------------------------------------
# Check current user or network
user_info <- dfp_getCurrentUser()
user_info[,c('id', 'isActive')]
network_info <- dfp_getCurrentNetwork()
network_info[,c('id', 'networkCode')]

## ---- eval=FALSE---------------------------------------------------------
#  # create a team and user and add the user to that team
#  
#  #first create the team
#  request_data <- list(teams=list(name="TestTeam1",
#                                  description='API Test Team 1',
#                                  hasAllCompanies='true',
#                                  hasAllInventory='true',
#                                  teamAccessType='READ_WRITE'))
#  dfp_createTeams_result <- dfp_createTeams(request_data)
#  
#  # second create the user
#  request_data <- data.frame(name = paste0("TestUser", 1:3),
#                             email = paste0('testuser', 1:3, '@gmail.com'),
#                             roleId = rep(-1, 3))
#  dfp_createUsers_result <- dfp_createUsers(request_data)
#  
#  # third associate the user to that team
#  request_data <- data.frame(teamid=rep(dfp_createTeams_result$id, 3),
#                             userid=dfp_createUsers_result$id)
#  dfp_createUserTeamAssociations_result <- dfp_createUserTeamAssociations(request_data)
#  
#  # Note: User roleId = -1 is the Administrative role
#  # use dfp_getAllRoles() to view other options
#  
#  # Creating custom roles is a premium feature, which
#  # small business accounts won't have and creating the roles
#  # can only be done from the user interface, not the API.

## ----eval = FALSE--------------------------------------------------------
#  # create a company and add a contact to it
#  
#  # first create the company
#  request_data <- list(companies=list(name="TestCompany1",
#                                      type='HOUSE_ADVERTISER',
#                                      address='123 Main St Hometown, FL USA',
#                                      email='testcompany1@gmail.com',
#                                      comment='API Test'))
#  dfp_createCompanies_result <- dfp_createCompanies(request_data)
#  
#  # second create the contact and specify the companyId
#  request_data <- list(contacts=list(name="TestContact1",
#                                      companyId=dfp_createCompanies_result$id,
#                                      status='UNINVITED',
#                                      cellPhone='(888) 999-7777',
#                                      comment='API Test',
#                                      email='testcontact1@gmail.com'))
#  dfp_createContacts_result <- dfp_createContacts(request_data)

