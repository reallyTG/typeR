library(HydeNet)


### Name: BlackJack
### Title: Black Jack Hybrid Decision Network
### Aliases: BlackJack
### Keywords: datasets

### ** Examples

## Not run: 
##D BlackJack <- 
##D        HydeNetwork(~ initialAces | card1*card2
##D                    + initialPoints | card1*card2
##D                    + highUpcard | dealerUpcard
##D                    + hit1 | initialPoints*highUpcard
##D                    + acesAfterCard3 | initialAces*card3
##D                    + pointsAfterCard3 | card1*card2*card3*acesAfterCard3
##D                    + hit2 | pointsAfterCard3*highUpcard
##D                    + acesAfterCard4 | acesAfterCard3*card4
##D                    + pointsAfterCard4 | card1*card2*card3*card4*acesAfterCard4
##D                    + hit3 | pointsAfterCard4*highUpcard
##D                    + acesAfterCard5 | acesAfterCard4*card5
##D                    + pointsAfterCard5 | card1*card2*card3*card4*card5*acesAfterCard5
##D                    + playerFinalPoints | initialPoints*hit1*pointsAfterCard3
##D                    *hit2*pointsAfterCard4*hit3*pointsAfterCard5
##D                    + dealerFinalPoints | dealerUpcard
##D                    + payoff | playerFinalPoints*dealerFinalPoints)
##D cardProbs  <- c(rep(1/13,8), 4/13, 1/13)  # probs. for 2, 3, ..., 9, (10-K), A
##D 
##D BlackJack <- setNode(BlackJack, card1, nodeType="dcat",  
##D                      pi=vectorProbs(p=cardProbs, card1))
##D BlackJack <- setNode(BlackJack, card2, nodeType="dcat",  
##D                      pi=vectorProbs(p=cardProbs, card2))
##D BlackJack <- setNode(BlackJack, card3, nodeType="dcat",  
##D                      pi=vectorProbs(p=cardProbs, card3))
##D BlackJack <- setNode(BlackJack, card4, nodeType="dcat",  
##D                      pi=vectorProbs(p=cardProbs, card4))
##D BlackJack <- setNode(BlackJack, card5, nodeType="dcat",  
##D                      pi=vectorProbs(p=cardProbs, card5))
##D 
##D BlackJack <- setNode(BlackJack, dealerUpcard, nodeType="dcat",
##D                pi=vectorProbs(p=cardProbs, dealerUpcard))
##D 
##D #Note: node dealerFinalPoints will be defined below, following some discussion 
##D #      about its conditional probability distribution.
##D 
##D #####################################
##D # Deterministic Nodes
##D #####################################
##D BlackJack <- setNode(BlackJack, highUpcard,     
##D                "determ", define=fromFormula(),
##D                nodeFormula = highUpcard ~ ifelse(dealerUpcard > 8, 1, 0))
##D 
##D BlackJack <- setNode(BlackJack, initialAces,    
##D                "determ", define=fromFormula(),
##D                nodeFormula = initialAces ~ ifelse(card1==10,1,0) + 
##D                               ifelse(card2==10,1,0))
##D 
##D BlackJack <- setNode(BlackJack, acesAfterCard3, 
##D                "determ", define=fromFormula(),
##D                nodeFormula = acesAfterCard3 ~ initialAces + ifelse(card3==10,1,0))
##D 
##D BlackJack <- setNode(BlackJack, acesAfterCard4, 
##D                "determ", define=fromFormula(),
##D                nodeFormula = acesAfterCard4 ~ acesAfterCard3 + ifelse(card4==10,1,0))
##D 
##D BlackJack <- setNode(BlackJack, acesAfterCard5, 
##D                "determ", define=fromFormula(),
##D                nodeFormula = acesAfterCard5 ~ acesAfterCard4 + ifelse(card5==10,1,0))
##D 
##D BlackJack <- setNode(BlackJack, initialPoints, 
##D                "determ", define=fromFormula(),
##D                nodeFormula = initialPoints ~ card1+card2+2)
##D 
##D BlackJack <- setNode(BlackJack, pointsAfterCard3, "determ", define=fromFormula(),
##D                nodeFormula = pointsAfterCard3 ~
##D                  ifelse(acesAfterCard3 == 3,
##D                         13,
##D                         ifelse(acesAfterCard3 == 2,
##D                                card1 + card2 + card3 + 3 - 10,
##D                                ifelse(acesAfterCard3 == 1,
##D                                       ifelse(card1 + card2 + card3 + 3 > 22,
##D                                              card1 + card2 + card3 + 3 - 10,
##D                                              card1 + card2 + card3 + 3),
##D                                       card1 + card2 + card3 + 3
##D                                )
##D                         )
##D                  )
##D )
##D 
##D BlackJack <- setNode(BlackJack, pointsAfterCard4, "determ", define=fromFormula(),
##D                nodeFormula = pointsAfterCard4 ~
##D                  ifelse(acesAfterCard4 == 4,
##D                         14,
##D                         ifelse(acesAfterCard4 == 3,
##D                                ifelse(card1 + card2 + card3 + card4 + 4 > 38,
##D                                       card1 + card2 + card3 + card4 + 4 - 30,
##D                                       card1 + card2 + card3 + card4 + 4 - 20
##D                                ),
##D                                ifelse(acesAfterCard4 > 0,
##D                                       ifelse(card1 + card2 + card3 + card4 + 4 > 22,
##D                                              card1 + card2 + card3 + card4 + 4 - 10,
##D                                              card1 + card2 + card3 + card4 + 4
##D                                       ),
##D                                       card1 + card2 + card3 + card4 + 4
##D                                )
##D                         )
##D                  )
##D )
##D 
##D BlackJack <- 
##D   setNode(BlackJack, pointsAfterCard5, "determ", define=fromFormula(),
##D           nodeFormula = pointsAfterCard5 ~ 
##D             ifelse(acesAfterCard5 == 5,
##D               15,
##D               ifelse(acesAfterCard5 == 4,
##D                 ifelse(card1 + card2 + card3 + card4 + card5 + 5 > 51,
##D                   card1 + card2 + card3 + card4 + card5 + 5 - 40,
##D                   card1 + card2 + card3 + card4 + card5 + 5 - 30
##D                 ),
##D                 ifelse(acesAfterCard5 == 3,
##D                   ifelse(card1 + card2 + card3 + card4 + card5 + 5 > 51,
##D                     card1 + card2 + card3 + card4 + card5 + 5 - 30,
##D                     card1 + card2 + card3 + card4 + card5 + 5 - 20
##D                   ),
##D                   ifelse(acesAfterCard5 == 2,
##D                     ifelse(card1 + card2 + card3 + card4 + card5 + 5 > 31,
##D                       card1 + card2 + card3 + card4 + card5 + 5 - 20,
##D                       card1 + card2 + card3 + card4 + card5 + 5 - 10
##D                     ),
##D                     ifelse(acesAfterCard5 > 0,
##D                       ifelse(card1 + card2 + card3 + card4 + card5 + 5 > 22,
##D                         card1 + card2 + card3 + card4 + card5 + 5 - 10,
##D                         card1 + card2 + card3 + card4 + card5 + 5
##D                       ),
##D                       card1 + card2 + card3 + card4 + card5 + 5
##D                     )
##D                   )
##D                 )
##D               )
##D             )
##D )
##D 
##D BlackJack <- setNode(BlackJack, playerFinalPoints, "determ", define=fromFormula(),
##D                nodeFormula = playerFinalPoints ~ 
##D                  ifelse(hit1 == 0,
##D                         initialPoints,
##D                         ifelse(hit2 == 0,
##D                                pointsAfterCard3,
##D                                ifelse(hit3 == 0, pointsAfterCard4, pointsAfterCard5)
##D                         )
##D                  )
##D )
##D 
##D BlackJack <- setDecisionNodes(BlackJack, hit1, hit2, hit3)
##D BlackJack <- setUtilityNodes(BlackJack, payoff)
## End(Not run)




