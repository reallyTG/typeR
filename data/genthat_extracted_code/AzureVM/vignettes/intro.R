## ---- eval=FALSE---------------------------------------------------------
#  ## using the subscription method
#  sub <- az_rm$
#      new(tenant="{tenant_id}", app="{app_id}", password="{password}")$
#      get_subscription("{subscription_id}")
#  
#  myNewVM <- sub$create_vm("myNewVM",
#      location="australiaeast",
#      username="datascience",
#      passkey="fAs30q-2a5vF!Z")  # be sure to choose a strong password!
#  
#  
#  ## using the resource group method
#  rg <- sub$create_resource_group("myresourcegroup",
#      location="australiaeast")
#  
#  myOtherVM <- rg$create_vm("myOtherVM",
#      username="datascience",
#      passkey="l3Kgrf21%?0DFm")

## ---- eval=FALSE---------------------------------------------------------
#  # examine VM sizes available in australiaeast region
#  sub$list_vm_sizes("australiaeast")
#  
#  # create a Linux (Ubuntu) NC-series DSVM using public key authentication
#  myLinuxVM <- sub$create_vm("myLinuxVM",
#      location="australiaeast",
#      size="Standard_NC6s_v3",
#      os="Ubuntu",
#      username="datascience",
#      passkey=readLines("~/id_rsa.pub"),
#      userauth_type="key")

## ---- eval=FALSE---------------------------------------------------------
#  ## using the subscription method
#  sub <- az_rm$
#      new(tenant="{tenant_id}", app="{app_id}", password="{password}")$
#      get_subscription("{subscription_id}")
#  
#  # retrieve the VM we created above
#  myNewVM <- sub$get_vm("myNewVM")
#  
#  
#  ## and with the resource group method
#  rg <- sub$get_resource_group("myresourcegroup")
#  
#  myOtherVM <- rg$get_vm("myOtherVM")

## ---- eval=FALSE---------------------------------------------------------
#  # simple bash script for executing on a Linux VM
#  script <-
#  '#!/bin/bash
#  
#  var=Hello world!
#  
#  # redirect output to a file so we know whether it ran successfully
#  echo "$var" > /tmp/helloworld.txt
#  '
#  
#  vm$run_script(script)

## ---- eval=FALSE---------------------------------------------------------
#  vm$delete()

## ---- eval=FALSE---------------------------------------------------------
#  myGpuVM <- sub$create_vm(size="Standard_NC12s_v3", ...)

## ---- eval=FALSE---------------------------------------------------------
#  sub <- az_rm$
#      new(tenant="{tenant_id}", app="{app_id}", password="{password}")$
#      get_subscription("{subscription_id}")
#  
#  # create a cluster of 5 Ubuntu VMs
#  vmCluster <- sub$create_vm_cluster("vmCluster",
#      location="australiaeast",
#      os="Ubuntu",
#      username="datascience",
#      passkey=readLines("~/id_rsa.pub"),
#      userauth_type="key",
#      clust_size=5)

